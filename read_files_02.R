

##### The purpose of this script is to improve upon version one
##### (read_files_01.R) by adding
##### functionality to transpose the aggregated files to be in wide format
##### and then save them to an Excel workbook
#### Date : 21st Nov 2024
####################################################################



#load libraries

library(tidyverse)
library(purrr)
library(here)
library(readxl)
library(openxlsx)


# List all CSV files in the various folders

csv_files_l <- list.files(here('Losartan NIR'), pattern = "\\.csv$")
# print(csv_files_l)


####    Losartan files   ##########
###################################

# Redefine read.csv function to make it easy to use with map_df from purrr,
# basically i wanted to skip the first row of the data because it didn't contain
# variable names rather it contained a description of the data set.

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


### some cool magic --- transpose to meet client's new requirements 
### -- write all the three sub-files as sheets in an Excel workbook

# write to excel workbook

losartan_intensity2 <- losartan_intensity %>%
  group_by(Wavelength) %>%
  mutate(Intensity_Col = paste0("Intensity_", row_number())) %>%
  pivot_wider(names_from = Intensity_Col, values_from = Intensity)

losartan_reflectance2 <- losartan_reflectance %>%
  group_by(Wavelength) %>%
  mutate(Reflectance_Col = paste0("Reflectance_", row_number())) %>%
  pivot_wider(names_from = Reflectance_Col, values_from = Reflectance)

losartan_absorbance2 <- losartan_absorbance %>%
  group_by(Wavelength) %>%
  mutate(Absorbance_Col = paste0("Absorbance_", row_number())) %>%
  pivot_wider(names_from = Absorbance_Col, values_from = Absorbance)


list_1 = list("losartan_intensity2" = losartan_intensity2, 
              "losartan_reflectance2" = losartan_reflectance2,
              "losartan_absorbance2" = losartan_absorbance2)

openxlsx::write.xlsx(list_1, 'Losartan.xlsx', 
                     sheetName = c('Intensity','Reflectance','Absorbance'))




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



# write to excel workbook

metronidazole_intensity2 <- metronidazole_intensity %>%
  group_by(Wavelength) %>%
  mutate(Intensity_Col = paste0("Intensity_", row_number())) %>%
  pivot_wider(names_from = Intensity_Col, values_from = Intensity)

metronidazole_reflectance2 <- metronidazole_reflectance %>%
  group_by(Wavelength) %>%
  mutate(Reflectance_Col = paste0("Reflectance_", row_number())) %>%
  pivot_wider(names_from = Reflectance_Col, values_from = Reflectance)

metronidazole_absorbance2 <- metronidazole_absorbance %>%
  group_by(Wavelength) %>%
  mutate(Absorbance_Col = paste0("Absorbance_", row_number())) %>%
  pivot_wider(names_from = Absorbance_Col, values_from = Absorbance)

# Write to Excel book

list_1 = list("metronidazole_intensity2" = metronidazole_intensity2, 
              "metronidazole_reflectance2" = metronidazole_reflectance2,
              "metronidazole_absorbance2" = metronidazole_absorbance2)

openxlsx::write.xlsx(list_1, 'Metronidazole.xlsx', 
                     sheetName = c('Intensity','Reflectance','Absorbance'))





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




side_intensity2 <- side_intensity %>%
  group_by(Wavelength) %>%
  mutate(Intensity_Col = paste0("Intensity_", row_number())) %>%
  pivot_wider(names_from = Intensity_Col, values_from = Intensity)

side_reflectance2 <- side_reflectance %>%
  group_by(Wavelength) %>%
  mutate(Reflectance_Col = paste0("Reflectance_", row_number())) %>%
  pivot_wider(names_from = Reflectance_Col, values_from = Reflectance)

side_absorbance2 <- side_absorbance %>%
  group_by(Wavelength) %>%
  mutate(Absorbance_Col = paste0("Absorbance_", row_number())) %>%
  pivot_wider(names_from = Absorbance_Col, values_from = Absorbance)

# Write to Excel book

list_1 = list("side_intensity2" = side_intensity2, 
              "side_reflectance2" = side_reflectance2,
              "side_absorbance2" = side_absorbance2)

openxlsx::write.xlsx(list_1, 'Side.xlsx', 
                     sheetName = c('Intensity','Reflectance','Absorbance'))





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


# write to excel workbook

top_intensity2 <- top_intensity %>%
  group_by(Wavelength) %>%
  mutate(Intensity_Col = paste0("Intensity_", row_number())) %>%
  pivot_wider(names_from = Intensity_Col, values_from = Intensity)

top_reflectance2 <- top_reflectance %>%
  group_by(Wavelength) %>%
  mutate(Reflectance_Col = paste0("Reflectance_", row_number())) %>%
  pivot_wider(names_from = Reflectance_Col, values_from = Reflectance)

top_absorbance2 <- top_absorbance %>%
  group_by(Wavelength) %>%
  mutate(Absorbance_Col = paste0("Absorbance_", row_number())) %>%
  pivot_wider(names_from = Absorbance_Col, values_from = Absorbance)

# Write to Excel book

list_1 = list("top_intensity2" = top_intensity2, 
              "top_reflectance2" = top_reflectance2,
              "top_absorbance2" = top_absorbance2)

openxlsx::write.xlsx(list_1, 'Top.xlsx', 
                     sheetName = c('Intensity','Reflectance','Absorbance'))




############  End of Program  ###############

#*******************************************#
  
#############################################

