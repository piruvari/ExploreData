#Base de dados

NEI <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/summarySCC_PM25.rds")
SCC <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/Source_Classification_Code.rds")

NEI$Emissionsmiles<-NEI$Emissions/1000

#6-Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in motor vehicle emissions?
require(ggplot2)
vehiclesNEI<-NEI[(NEI$fips == "24510" | NEI$fips == "06037")& NEI$type == 'ON-ROAD',]
vehiclesPM25byYear<-aggregate(Emissions ~ year * fips, vehiclesNEI, sum)
qplot(year, Emissions, data=vehiclesPM25byYear, geom="line", color=fips) + ggtitle("EMISIONES DE MOTORES DE BALTIMORE Y LA") + xlab("YEAR") + ylab(expression("EMISIONES"))
dev.copy(png, file='D:/cursos/data Science/exploratory-data-analysis/data/plot6.png', width = 480, height = 480, units = "px")
dev.off()

