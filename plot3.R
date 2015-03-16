#This code assumes that the files have been downloaded and unzipped into
#the working directory.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- data.table(NEI)

BmorebyYearType <- NEI[fips == "24510"][, sum(Emissions), by = list(year, type)]
setnames(BmorebyYearType, old = c("year", "V1"), new = c("Year", "Emissions"))

png("plot3.png", height = 480, width = 480)
qplot(Year, Emissions, data = BmorebyYearType, facets = type~., color = type, geom = c("line", "point"))

dev.off()
