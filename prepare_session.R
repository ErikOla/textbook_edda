library(nycflights13)
library(tidyverse)
library(lubridate)
library(forcats)
library(RColorBrewer)
library(OutliersO3)
library(pander)

data("flights")
data("airlines")
data("airports")

out_format <- knitr::opts_knit$get("rmarkdown.pandoc.to")
