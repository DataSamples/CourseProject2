#This code assumes that the files have been downloaded and unzipped into
#the working directory.

#Motor vehicle related sources are defined as those for which the SCC.Level.Three
#contains the phrase motor vehicle. Totals were analyzed, so as to produce the
#most informative graphs.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- data.table(NEI)

motor <- SCC[grep(pattern = "veh", SCC.Level.Three, ignore.case = TRUE)]
motorSCC <- motor$SCC

Bmore <- NEI[fips=="24510"]
LA <- NEI[fips=="06037"]
motorBmoreSums <- Bmore[SCC%in%motorSCC][, sum(Emissions), by = year]
motorBmoreSums <- cbind(motorBmoreSums, rep("Baltimore City", 4))
motorLASums <- LA[SCC%in%motorSCC][, sum(Emissions), by = year]
motorLASums <- cbind(motorLASums, rep("Los Angeles County", 4))
motorSums <- rbind(motorBmoreSums, motorLASums)
setnames(motorSums, old = names(motorSums),
         new = c("Year", "Emissions", "County"))

png("plot6.png", height = 480, width = 480)
plot <- qplot(Year, Emissions, data = motorSums, color = County,
              geom = c("point", "line"),
              ylab = "Total motor vehicle emissions (tons)",
              main = "Motor vehicle PM2.5 emissions in Baltimore City and
              Los Angeles County, '99-'08")
plot <- plot + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))
plot
dev.off()

#The total emissions for motor vehicle related sources, as defined as the short name,
#containing at least the string "veh", have decreased overall from 1999-2008
#for both Baltimore City and Los Angeles County. However, Los Angeles County's
#total emissions are much higher than those of Baltimore City throughout the time period.