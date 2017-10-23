##Analysis intended to describe the relationship between GC content and length of ears.
houseelf.data <- read.csv('./Data/houseelf_earlength_dna_data_1.csv')

#calculates GC content regardless of case
library(stringr)

gc_content <- function(sequence){
  sequence <- str_to_lower(sequence)
  gs <- str_count(sequence, "g")
  cs <- str_count(sequence, "c")
  gc_content <- (gs + cs) / str_length(sequence) * 100 
  return(gc_content)
}

get_size_class <- function(ear_length){
   # Calculate the size class for one or more earth lengths
   ear_lengths <- ifelse(ear_length > 10, "large", "small")
   return(ear_lengths)
}

ear_data <- data.frame(id=houseelf.data$id, sizeclass= NA, gccontent= NA)

ear_data$gccontent <- sapply(houseelf.data$dnaseq, gc_content)
ear_data$sizeclass <- sapply(houseelf.data$earlength, get_size_class)

write.csv(ear_data, 'ear_data.csv')
