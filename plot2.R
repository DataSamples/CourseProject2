#This code assumes that the files have been downloaded and unzipped into
#the working directory.

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
#NEI <- data.table(NEI)

BmorebyYear <- NEI[fips == "24510"][, sum(Emissions), by = year]

png("plot2.png", height = 480, width = 480)
plot(BmorebyYear, type = "b", xlab = "Year",
     ylab = "Total emissions (tons)",
     main = "Total PM2.5 emissions in Baltimore '99-'08",
     xaxt = "n")
axis(side = 1, at = sumsbyYear$year, labels = TRUE)
dev.off()

#Total PM2.5 emissions have decreased overall in Baltimore from 199-2008, despite
#a spike in 2005.