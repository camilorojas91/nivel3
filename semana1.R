library(lubridate)
##Crea carpetas en el proyecto si no existen
if(!dir.exists("datos")){
  dir.create("datos")
}

if(!dir.exists("salidas")){
  dir.create("salidas")
}

URL <- "https://data.humdata.org/dataset/a994bd31-3708-4437-9ddc-1e06e96fb969/resource/6cd15e4c-44a7-4dad-957b-e86f8ad50984/download/fts_requirements_funding_zmb.csv"

date_download <- today()

nombre_archivo <- paste("datos/zambia",date_download,".csv", sep = "")

datos_zambia <- download.file(url = URL,destfile =nombre_archivo)

#### datos en formato XML

library(XML)

URL <- "https://www.espn.com.co/futbol/resultados"

base <- htmlTreeParse(URL, useInternal = TRUE)
resultados <- xpathSApply(base, "//li[@class = 'body']", xmlValue)
                          print(base)
                          
#### Ejercicio Quiz####

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
nombre_archivo <- "datos/quiz.csv"
base_Q <- download.file(url = URL,destfile =nombre_archivo)
library(dplyr)
library(readr)
quiz <- read_csv("datos/quiz.csv")
                
                  
                          x <- quiz %>% 
                            select(VAL) %>% 
                            filter(VAL == 24)
                              
                          
                          table(x)
                          
                          quiz$FES
                          
                          
library(rio)      
base2 <- import("datos/getdata_data_DATA.gov_NGAP.xlsx")       
colnames(base2)<- base2[1,]
base2 <- base2[-1,]
dat <- base2[7:15,18:23]

       

URL <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"

base <- htmlTreeParse(URL, useInternalNodes = T)
rootNode <- xmlRoot(base)
names(rootNode)

rootNode[[1]][[1]]

xmlSApply(rootNode, "//zipcode",xmlValue)

print(rootNode)
