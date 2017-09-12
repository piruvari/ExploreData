#Base de dados

NEI <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/summarySCC_PM25.rds")
SCC <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/Source_Classification_Code.rds")

NEI$Emissionsmiles<-NEI$Emissions/1000

##1-Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? 
##Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008

EMISIONES_YEAR<-tapply(NEI$Emissionsmiles, NEI$year, sum)
Y<-plot(names(EMISIONES_YEAR),EMISIONES_YEAR,col=("red"), main = "TOTAL EMISIONES por miles",xlab="YEAR", ylab = "EMISIONES POR MILES", type = 'l')
dev.copy(png, file='D:/cursos/data Science/exploratory-data-analysis/data/plot1.png', width = 480, height = 480, units = "px")
dev.off()
