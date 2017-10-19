##Analysis intended to describe the relationship between GC content and length of ears.
houseelf.data <- read.csv('./Data/houseelf_earlength_dna_data_1.csv')

#calculates GC content regardless of case

gc_content <- function(sequence){
  str_to_lower(sequence)
  gs <- str_count(sequence, "g")
  cs <- str_count(sequence, "c")
  gc_content <- (Gs + Cs) / str_length(sequence) * 100 
  return(gc_content)
}
