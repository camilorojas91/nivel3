##Crea carpetas en el proyecto si no existen
if(!dir.exists("datos")){
  dir.create("datos")
}

if(!dir.exists("salidas")){
  dir.create("salidas")
}

library(RMySQL)

ucscDB <- dbConnect(MySQL(), user = "genome",
                    host="genome-mysql.cse.ucsc.edu")
result<- dbGetQuery(ucscDB, "show databases;");dbDisconnect(ucscDB)

result

ucscDB <- dbConnect(MySQL(), user = "genome",db = "hg19",
                    host="genome-mysql.cse.ucsc.edu")
dbListTables(ucscDB)

dbListFields(ucscDB, "affyU133Plus2")

tabla <- dbReadTable(ucscDB, "affyU133Plus2")

library(XML)

con <- url("http://biostat.jhsph.edu/~jleek/contact.html")

htmlCode <- readLines(con)

close(con)

htmlCode

url <- "http://biostat.jhsph.edu/~jleek/contact.html"

html <- htmlTreeParse(htmlCode, useInternalNodes = T)

html

library(httr)
library(stringr)

html2 <- GET(url)
text<-content(html2, as = "text")

# Dividir el contenido en líneas
lines <- str_split(text, "\n")[[1]]
lines
# Contar caracteres por línea
character_counts <- str_length(lines)

# Imprimir los resultados
for (i in seq_along(lines)) {
  cat("Línea", i, ":", character_counts[i], "caracteres\n")
  
#### punto 5 ####
  # URL del archivo de datos
  url <- "https://www.cpc.ncep.noaa.gov/data/indices/wksst8110.for"
  
  # Leer el contenido del archivo y almacenarlo en una variable
  file_content <- readLines(url)
  
  # Eliminar las líneas vacías
  file_content <- file_content[file_content != ""]
  
  # Crear un data frame vacío para almacenar los datos
  data <- data.frame()
  
  # Iterar a través del contenido del archivo y extraer los datos
  for (line in file_content) {
    # Dividir la línea en campos usando espacios en blanco como separadores
    fields <- strsplit(line, "\\s+")[[1]]
    
    # Crear una fila de datos y agregarla al data frame
    data <- rbind(data, fields)
  }
}

colnames(data)<- data[2,]

data<- data[-1:-3,]

data$Nino34 <- as.numeric(data$Nino34)

