#This code assumes that the files have been downloaded and unzipped into
#the working directory.

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
#NEI <- data.table(NEI)

sumsbyYear <- NEI[, sum(Emissions), by = year]
png("plot1.png", height = 480, width = 480)
plot(sumsbyYear, type = "b", xlab = "Year",
     ylab = "Total emissions (tons)",
     main = "Total PM2.5 emissions across the US '99-'08", xaxt = "n")
axis(side = 1, at = sumsbyYear$year, labels = TRUE)
dev.off()

#Total PM2.5 emissions have decreased in the United States from 1999-2008.