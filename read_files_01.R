

#load libraries

library(tidyverse)
library(purrr)
library(here)


# List all CSV files in the various folders

csv_files_l <- list.files(here('Losartan NIR'), pattern = "\\.csv$")
# print(csv_files_l)


####    Losartan files   ##########
###################################

read.csv2 <- function(file) {
  
  read.csv(here('Losartan NIR', file), skip = 1)
}


losartan_files <- map_df(csv_files_l, read.csv2)

dim(losartan_files)


losartan_reflectance <- losartan_files %>% select(Wavelength, Reflectance)
losartan_absorbance  <- losartan_files %>% select(Wavelength, Absorbance)
losartan_intensity   <- losartan_files %>% select(Wavelength, Intensity)

#write to csv files

write.csv(losartan_reflectance, "losartan_reflectance.csv", row.names = F)
write.csv(losartan_absorbance, "losartan_absorbance.csv", row.names = F)
write.csv(losartan_intensity, "losartan_intensity.csv", row.names = F)




####    Metronidazole NIR files   ##########
############################################

read.csv2 <- function(file) {
  
  read.csv(here('Metronidazole NIR', file), skip = 1)
}

csv_files_m <- list.files(here('Metronidazole NIR'), pattern = "\\.csv$")


metronidazole_files <- map_df(csv_files_m, read.csv2)

dim(metronidazole_files)


metronidazole_reflectance <- metronidazole_files %>% select(Wavelength, Reflectance)
metronidazole_absorbance  <- metronidazole_files %>% select(Wavelength, Absorbance)
metronidazole_intensity   <- metronidazole_files %>% select(Wavelength, Intensity)

#write to csv files

write.csv(metronidazole_reflectance, "metronidazole_reflectance.csv", row.names = F)
write.csv(metronidazole_absorbance, "metronidazole_absorbance.csv", row.names = F)
write.csv(metronidazole_intensity, "metronidazole_intensity.csv", row.names = F)






####    Tenofovir files (top and side)  ##########
##################################################


# Side files


read.csv2 <- function(file) {
  
  read.csv(here('Side', file), skip = 1)
}

csv_files_s <- list.files(here('Side'), pattern = "\\.csv$")


side_files <- map_df(csv_files_s, read.csv2)

dim(side_files)


side_reflectance <- side_files %>% select(Wavelength, Reflectance)
side_absorbance  <- side_files %>% select(Wavelength, Absorbance)
side_intensity   <- side_files %>% select(Wavelength, Intensity)

#write to csv files

write.csv(side_reflectance, "side_reflectance.csv", row.names = F)
write.csv(side_absorbance,  "side_absorbance.csv", row.names = F)
write.csv(side_intensity,   "side_intensity.csv", row.names = F)



# Top files

read.csv2 <- function(file) {
  
  read.csv(here('Top', file), skip = 1)
}

csv_files_t <- list.files(here('Top'), pattern = "\\.csv$")


top_files <- map_df(csv_files_t, read.csv2)

dim(top_files)


top_reflectance <- top_files %>% select(Wavelength, Reflectance)
top_absorbance  <- top_files %>% select(Wavelength, Absorbance)
top_intensity   <- top_files %>% select(Wavelength, Intensity)

#write to csv files

write.csv(top_reflectance, "top_reflectance.csv", row.names = F)
write.csv(top_absorbance,  "top_absorbance.csv", row.names = F)
write.csv(top_intensity,   "top_intensity.csv", row.names = F)



############  End of Program  ###############

#*******************************************#
  
#############################################

