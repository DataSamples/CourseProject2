#This code assumes that the files have been downloaded and unzipped into
#the working directory.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- data.table(NEI)

BmorebyYearType <- NEI[fips == "24510"][, sum(Emissions), by = list(year, type)]
setnames(BmorebyYearType, old = c("year", "V1"), new = c("Year", "Emissions"))

png("plot3.png", height = 480, width = 480)
plot <- qplot(Year, Emissions, data = BmorebyYearType, color = type,
              geom = c("line", "point"),
              main = "Total PM2.5 emissions in Baltimore '99-'08 by source type",
              ylab = "Total emissions (tons)")
plot <- plot + facet_wrap(~type, ncol = 2) +
        scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))
plot
dev.off()

#The "Point" type of emission increased in Baltimore from 1999-2008,
#while the other types decreased