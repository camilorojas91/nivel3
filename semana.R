library(rio)
library(dplyr)
install_formats()
library(stringr)

data <- import("./datos/911_Behavioral_Health__Diversion.csv")

names(data)

tolower(names(data)) # Minusculas

toupper(names(data)) #Mayusculas

strsplit(data$callDateTime, split = "/")

## Regular expretions ###


data <- import("./datos/getdata_data_ss06hid (3).csv")

strsplit(names(data), split = "wgtp")

data2 <- import("./datos/getdata_data_GDP.csv")

data2 <- data2[-1:-5,]
data2 <- data2[,-3]
data2 <- data2[,-6:-10]
data2 <- data2[-191:-326,]

data2$V5 <- gsub(",","",data2$V5)

data2$V5 <- trimws(data2$V5)

data2$V5 <- as.numeric(data2$V5)

mean(data2$V5)

grep("*United",data2$V4)

data3 <- import("./datos/getdata_data_EDSTATS_Country.csv")

data3 <- data3 %>% 
  select(CountryCode, `Special Notes`)

data4 <- merge(x = data2, y = data3, by.x = "V1", by.y = "CountryCode")

table(str_count(data4$`Special Notes`, pattern = "June"))

install.packages("quantmod")
library(quantmod)
amzn <- getSymbols("AMZN", auto.assign = F)
sampleTimes = index(amzn)
library(lubridate)

table(year(sampleTimes))

c <- format(sampleTimes, "%A,%B,%Y")

partes <- strsplit(c, ",")

# Convertir la lista de partes en un data frame
data_frame <- data.frame(matrix(unlist(partes), ncol = length(partes)))

data_frame <- as.data.frame(t(data_frame))

# Nombrar las columnas del data frame
colnames(data_frame) <- c("dia", "mes", "año")

data_frame <- filter(data_frame$año == "2012")

table(data_frame$dia)
