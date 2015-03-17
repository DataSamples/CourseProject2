#This code assumes that the files have been downloaded and unzipped into
#the working directory.

#Coal-combustion related sources are defined as those for which the EI.Sector,
#or emission inventory sector, contains the word coal.

#NEI <- readRDS("summarySCC_PM25.rds")
#SCC <- readRDS("Source_Classification_Code.rds")
#NEI <- data.table(NEI)

coal <- SCC[grep(pattern = "coal", EI.Sector, ignore.case = TRUE)]
coalSCC <- coal$SCC

coalNEI <- NEI[SCC%in%coalSCC]

png("plot4.png", height = 480, width = 480)
plot <- qplot(year, Emissions, data = coalNEI, ylab = "Emissions (tons)",
              main = "Coal-combustion related PM2.5 emissions across the US, '99-'08")
plot <- plot + scale_x_continuous(breaks = c(1999, 2002, 2005, 2008))
plot
dev.off()

#The emissions for coal-combustion related sources, as defined based on a given
#source's emissions inventory sector, have decreased overall from 1999-2008,
#despite a spike in 2005.
