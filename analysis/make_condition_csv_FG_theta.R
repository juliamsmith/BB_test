library(tidyverse)

# Get all FG_theta subdirectories
fg_vary_path <- "/mmfs1/gscratch/biology/jmsmith/BB_test/to_store/FG_vary/" #"../to_store/FG_vary/"

fg_theta_dirs <- list.dirs(path = fg_vary_path, full.names = FALSE, recursive = FALSE)


lookup_table <- data.frame()
all_results <- tibble()

for (fg_theta_dir in fg_theta_dirs) {
  # Extract FG_theta value from directory name
  if (grepl("zero_feeding", fg_theta_dir)) {
    fg_theta_val <- -99
  } else {
    fg_theta_val <- as.numeric(str_extract(fg_theta_dir, "(?<=FG_theta_)[0-9.]+"))
  }
  
  # Get all condition directories within this FG_theta folder
  fg_theta_path <- paste0(fg_vary_path, fg_theta_dir, "/")
  conditions <- list.files(fg_theta_path)
  
  for (my_condition in conditions) {
    my_condition <- str_remove(my_condition, ".csv") # remove .csv from the file name
    my_condition <- str_remove(my_condition, "results")
    
    # split the string to extract parameters
    my_split <- strsplit(my_condition, "_|\\=")[[1]]
    
    # extract parameters
    num_males <- as.numeric(my_split[9])
    num_mar <- as.numeric(my_split[11])
    
    # Add to lookup table with FG_theta
    lookup_table <- rbind(lookup_table, data.frame(
      directory = my_condition,
      fg_theta_dir = fg_theta_dir,
      fg_theta = fg_theta_val,
      num_males = num_males,
      num_mar = num_mar
    ))
    
    # Read and load each result
    my_dir_results <- paste0(fg_theta_path, my_condition, "/results/")
    my_results <- list.files(my_dir_results)
    
    if (length(my_results) > 0) {
      # process each file
      for (my_file in my_results) {
        # extract the random seed
        my_rnd_seed <- strsplit(substr(my_file, 5, 1000), "D")[[1]][1]
        my_rnd_seed <- as.numeric(my_rnd_seed)
        
        tmp <- read_csv(paste0(my_dir_results, my_file), show_col_types = FALSE) %>%
          add_column(rnd_seed = my_rnd_seed,
                     directory = my_condition,
                     fg_theta_dir = fg_theta_dir)
        
        tmp <- tmp %>% select(probability_maraud, successful_mating, x_pos, y_pos,
                      foraging_hrs, staying_hrs, repairing_hrs,
                      marauding_events, marauding_hrs, traveling_hrs,
                      rnd_seed, directory, fg_theta_dir, mar_attempts, mate_attempts)


        
        all_results <- rbind(all_results, tmp)
      }
    }
  }
}


# Join with lookup table to add FG_theta and other parameters
all_results <- all_results %>% inner_join(lookup_table, by = c("directory", "fg_theta_dir"))


# Write one CSV per condition (like the original)
for (my_theta_dir in unique(all_results$fg_theta_dir)) {
  fg_data <- filter(all_results, fg_theta_dir == my_theta_dir)
  for (my_condition in unique(fg_data$directory)) {
    write_csv(filter(fg_data, directory == my_condition), 
              path = paste0("results_", my_theta_dir, "_", my_condition, ".csv"))
  }
}
