#This code assumes that the files have been downloaded and unzipped into
#the working directory.

#Motor vehicle related sources are defined as those for which the SCC.Level.Three
#contains the phrase motor vehicle.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")
NEI <- data.table(NEI)

motor <- SCC[grep(pattern = "veh", SCC.Level.Three, ignore.case = TRUE)]
motorSCC <- motor$SCC

Bmore <- NEI[fips=="24510"]
motorNEI <- Bmore[SCC%in%motorSCC]

png("plot5.png", height = 480, width = 480)
plot <- qplot(year, Emissions, data = motorNEI, ylab = "Emissions (tons)",
              main = "Motor vehicle related PM2.5 emissions in Baltimore City,
              '99-'08")
plot <- plot + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))
plot
dev.off()

#The emissions for motor vehicle related sources, as defined as the short name,
#containing at least the string "veh", have decreased overall from 1999-2008,
#despite a spike in 2005.