#load data in from csv file
library(readr)
Seal_Data <- read_csv("~/Desktop/Biostat/FinalProject/Data/Seal_Data.csv")
View(Seal_Data)

#data analysis - 2 sample t-test, paired
Seal_Test <- t.test(Seal_Data$O2_Nonfeeding, Seal_Data$O2_Feeding, paired = TRUE)

#plot to visualize sample data
boxplot(data = Seal_Data, Seal_Data$O2_Nonfeeding, Seal_Data$O2_Feeding,
        xlab = "Nonfeeding Dive                     Feeding Dive", 
        ylab = "Oxygen Consumption (ml O2 Kg^-1)",
        main = "Metabolic Cost of Weddell Seal Dives")

#plot to visualize sample data & export plot to results folder as pdf
pdf(file = "~/Desktop/Biostat/FinalProject/Results/Seal_Boxplot.pdf",
    width = 6,
    height = 6)

boxplot(data = Seal_Data, Seal_Data$O2_Nonfeeding, Seal_Data$O2_Feeding,
        xlab = "Nonfeeding Dive                     Feeding Dive", 
        ylab = "Oxygen Consumption (ml O2 Kg^-1)",
        main = "Metabolic Cost of Weddell Seal Dives")

dev.off()

#export plain text file containing output of test (test stat & p-value)

#no summary function for t-test, so do not include it in output of results.
Seal_Test

out <- capture.output(Seal_Test)
cat("Results", out, file="~/Desktop/Biostat/FinalProject/Results/summary.txt", sep="\n", append=FALSE)

