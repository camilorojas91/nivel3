
library(rio)

if(!file.exists("./datos")){dir.create("./datos")}

base <- import("./datos/zambia.csv")

as.data.frame(table(base$typeId, base$startDate))

#tabla bivariada

table(base$year %in% 2021)

base$year <- as.numeric(base$year)

summary(base$year)

base$year_quinquenio <- cut(base$year, breaks = seq(2000,2030, by = 5))

table(base$year_quinquenio,base$year_quinquenio)

library(Hmisc)

base <- na.delete(base)

cut2(base$year,g = 3)

library(reshape2)

base2 <- mtcars
base2$carname <- rownames(base2)
base_analis_carro_motor <- melt(base2, id.vars = c("carname","cyl","gear") )

##### ejercicio ####

library(rio)

base_ejercicio <- import("./datos/getdata_data_ss06hid (2).csv")

x <- which(base_ejercicio$AGS == 6 & base_ejercicio$ACR == 3)

summary(base_ejercicio$NPF)
?which()

#install.packages("jpeg")
library(jpeg)

download.file("https://d396qusza40orc.cloudfront.net/getdata%2Fjeff.jpg", destfile = "./datos/foto.jpg")
foto <- readJPEG(source = "./datos/foto.jpg", native = T)

?quantile()
quantile(foto, probs = c(0.3,0.8))

base_pais_1 <- import("./datos/getdata_data_EDSTATS_Country.csv")
base_pais_2 <- import("./datos/getdata_data_GDP.csv")

base_pais_2<- base_pais_2[-1:-5,]
base_pais_2<- base_pais_2[,c(-3,-7:-10)]

colnames(base_pais_2) <- c("CountryCode", "Ranking", "Economy", "Millons of Dollars","letras")

union <- merge(base_pais_1, base_pais_2, by = "CountryCode")

union$Ranking <- as.numeric(union$Ranking)

union <- union[complete.cases(union$Ranking), ]


library(dplyr)
union1 <- union %>% 
  arrange(desc(as.numeric(Ranking))) %>% 
  select(Ranking, `Income Group`) %>% 
  filter(`Income Group` == c("High income: OECD", "High income: nonOECD")) %>% 
  group_by(`Income Group`) %>% 
  summarise(meanRanking)



union$Ranking <- as.numeric(union$Ranking)
table(cut2(union$Ranking,g = 5), union$`Income Group`)
