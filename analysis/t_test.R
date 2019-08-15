library(tidyverse)

conditions <- list.files(pattern = "results_scrambleD_pmar=0.054_dist=500") #list.files(pattern = "\\.csv$")
all_results <- tibble()
for (my_condition in conditions){
  tmp <- read_csv(my_condition)
  all_results <- rbind(all_results, tmp)
}

conditions <-str_replace(str_replace(conditions, "results_scramble", ""), ".csv", "")

print(nrow(all_results))


#a simpler way
strat=.054
p=rep(NA, length(conditions)+1)
p[1]=0
conds=rep(NA, length(conditions)+1)
i=2
for(cond in conditions){
  res <- filter(all_results,directory==cond)
  marauders <- filter(res, probability_maraud == strat)
  guarders <- filter(res, probability_maraud == 0.0)
  print(t.test(marauders$successful_mating, guarders$successful_mating))
  print(cond)
  t <- t.test(marauders$successful_mating, guarders$successful_mating)
  #print(t)
  #print(cond)
  p[i]=t$p.value
  conds[i]=cond
  i=i+1 
  #print(paste("variance of marauder matings", var(marauders$successful_mating)))
  #print(paste("variance of guarder matings", var(guarders$successful_mating)))
}

new_p <- p.adjust(p, method = "holm")
#print(new_p_100)
print("insignificant conditions:")
print(conds[new_p>.05])

