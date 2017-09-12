#Base de dados

NEI <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/summarySCC_PM25.rds")
SCC <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/Source_Classification_Code.rds")

NEI$Emissionsmiles<-NEI$Emissions/1000

##2-Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.
Baltimore<-NEI[NEI$fips == "24510",]
BaltimorePM25<-tapply(Baltimore$Emissions, Baltimore$year, sum)
x<-plot(names(BaltimorePM25), BaltimorePM25, type = 'l', col = 'blue', xlab = "YEAR", main = "TOTAL DE EMISIONES EN BALTIMORE")
dev.copy(png, file='D:/cursos/data Science/exploratory-data-analysis/data/plot2.png', width = 480, height = 480, units = "px")
dev.off()

