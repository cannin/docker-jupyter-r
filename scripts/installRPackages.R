#!/usr/bin/Rscript

setRepositories(ind=1:6)
options(repos="http://cran.rstudio.com/")
if(!require(devtools)) { install.packages("devtools") }
library(devtools)

# Need RCurl for install_github
install.packages('RCurl')

install_github('armstrtw/rzmq')
install_github('IRkernel/repr')
install_github('IRkernel/IRdisplay')
install_github('IRkernel/IRkernel')

IRkernel::installspec()
