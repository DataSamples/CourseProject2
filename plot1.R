#setwd("F:/Data_Science_Coursera/Exploratory_Data_Analysis/CourseProject2")
#download.file(url = "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip", destfile = "NEI_data.zip")
#unzip(zipfile = "NEI_data.zip", exdir = ".")
#file.remove("NEI_data.zip")

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")