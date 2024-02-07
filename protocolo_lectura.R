tabla <-read.table()

# Este material fue creado en base a la pagina
# https://readxl.tidyverse.org

# si aun no lo has instalado :
# install.packages("tidyverse")

library(tidyverse)
library(readxl)


getwd()
#setwd("/Users/vjimenez/Dropbox/cursos/RLadies/meetup_febrero_2024/")
examples_file<-"data/datasets.xlsx"
# read_excel() lee archivos xls y xlsx y detecta el formato de la extensión.
xls_example<-read_excel(examples_file)
xls_example

#Para listar las hojas de un libro de excel usamos:
excel_sheets(examples_file)
help(iris)
help(chickwts)
help(quakes)

# Podemos expecificar el nombre de la hora de trqabaja por el nombre
pollos<-read_excel(examples_file, sheet = "chickwts")

require(stats); require(graphics)
boxplot(weight ~ feed, data = pollos, col = "lightgray",
        varwidth = TRUE, notch = TRUE, main = "chickwt data",
        ylab = "Weight at six weeks (gm)")

# Tambien podemos expecificar el nombre de la hora de trqabaja por el numero
terremotos<-read_excel(examples_file, sheet = 4)

# Hay varias formas de controlar qué celdas se leen. 
#Incluso puede especificar la hoja aquí, si proporcionas un rango de celdas estilo Excel.

#Leyendo maximo 3 renglones:
read_excel(examples_file, n_max = 3)

#Leamos de la celda C1 a la celda E4:
read_excel(examples_file, range = "C1:E4")

#leamos del renglon 4 al 8:
read_excel(examples_file, range = cell_rows(4:8))

#Leamos los datos de la columna D a al E:
read_excel(examples_file, range = cell_cols("B:D"))

# finalmente leeamos de la hoja mtcars, de la celda B1 a la celda D5
(subtabla<-read_excel(examples_file, range = "mtcars!B1:D5"))

#Mademos esa tabla a un nuevo archivo:
install.packages("writexl")
library(writexl)
tmp<-writexl::write_xlsx(subtabla,"Data/subtabla.xlsx")

#Mi recomendacion? Guarda los datos sin formato:

iris_xl <- read_excel(examples_file,sheet = "iris") %>% 
  write_csv("Data/iris-raw.csv")

#en lugar de la version en excel que ocupa mas del doble:
  writexl::write_xlsx(iris_xl,"Data/iris.xlsx")
