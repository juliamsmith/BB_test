library(tidyverse)

# Get all CSV files from old_analysis directory
old_dir <- "../../old_analysis"
csv_files <- list.files(old_dir, pattern = "\\.csv$", full.names = TRUE)

# Process each file
for (csv_file in csv_files) {
  # Get just the filename (without path)
  file_name <- basename(csv_file)
  
  # Read the CSV
  data <- read_csv(csv_file, show_col_types = FALSE)
  
  # Remove mar_attempts and mate_attempts columns
  cleaned_data <- data %>% select(-mar_attempts, -mate_attempts)
  
  # Write to current directory with same filename
  write_csv(cleaned_data, file_name)
}
