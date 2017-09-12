#Base de dados

NEI <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/summarySCC_PM25.rds")
SCC <- readRDS("D:/cursos/data Science/exploratory-data-analysis/data/Source_Classification_Code.rds")

NEI$Emissionsmiles<-NEI$Emissions/1000

##3-Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
##which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
##Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)
Baltimore<-NEI[NEI$fips == "24510",]
BaltimorePM25byYearType<-aggregate(Emissions ~ year + type, Baltimore, sum)
ggplot(BaltimorePM25byYearType, aes(year, Emissions, color = type)) + geom_line() +  xlab("YEAR") +  ylab('EMISIONES') +  ggtitle('TOTAL DE EMISIONES EN BALTIMORE POR TYPE')
dev.copy(png, file='D:/cursos/data Science/exploratory-data-analysis/data/plot3.png', width = 480, height = 480, units = "px")
dev.off()
