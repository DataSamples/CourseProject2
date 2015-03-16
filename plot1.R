

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- data.table(NEI)

sumsbyYear <- NEI[, sum(Emissions), by = year]
png("plot1.png", height = 480, width = 480)
plot(sumsbyYear, type = "b", xlab = "Year", ylab = "Total Emissions", main = "Total Emissions for the years 1999, 2002, 2005, 2008", xaxt = "n")
axis(side = 1, at = sumsbyYear$year, labels = TRUE)
dev.off()
