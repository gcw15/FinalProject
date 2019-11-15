#load data in from csv file
library(readr)
Seal_Data <- read_csv("Desktop/Biostat/FinalProject/Data/Seal_Data.csv")
View(Seal_Data)

#data analysis - 2 sample t-test, paired
t.test(Seal_Data$O2_Nonfeeding, Seal_Data$O2_Feeding, paired = TRUE)

