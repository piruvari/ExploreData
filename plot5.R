#Base de dados

NEI <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/summarySCC_PM25.rds")
SCC <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/Source_Classification_Code.rds")

NEI$Emissionsmiles<-NEI$Emissions/1000


##5-How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?
require(ggplot2)
vehiclesNEI<-NEI[NEI$fips == "24510" & NEI$type == 'ON-ROAD',]
vehiclesPM25byYear<-aggregate(Emissions ~ year, vehiclesNEI, sum)
qplot(year, Emissions, data=vehiclesPM25byYear, geom="line") + ggtitle('EMISIONES DE VEHICULOS EN BALTIMORE')
dev.copy(png, file='D:/cursos/data Science/exploratory-data-analysis/data/plot5.png', width = 480, height = 480, units = "px")
dev.off()
