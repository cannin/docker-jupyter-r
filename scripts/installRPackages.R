#!/usr/bin/Rscript

setRepositories(ind=1:6)
options(repos="http://cran.rstudio.com/")
if(!require(devtools)) { install.packages("devtools") }
library(devtools) 

install.packages("devtools")
# Need RCurl for install_github
install.packages('RCurl')
library(devtools)

install_github('armstrtw/rzmq')
install_github('IRkernel/repr')
install_github('IRkernel/IRdisplay')
install_github('IRkernel/IRkernel')

IRkernel::installspec()

# Useful packages
install.packages("ggplot2")
install.packages("plyr")
install.packages("reshape2")
install.packages("data.table")
install.packages("Hmisc")
install.packages("reshape")
install.packages("ggthemes")





