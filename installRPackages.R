#!/usr/bin/Rscript

install.packages("devtools", repos="http://cran.rstudio.com/")
# Need RCurl for install_github
install.packages('RCurl', repos="http://cran.rstudio.com/")
library(devtools)

install_github('armstrtw/rzmq')
install_github('IRkernel/repr')
install_github('IRkernel/IRdisplay')
install_github('IRkernel/IRkernel')

IRkernel::installspec()


# Useful packages
install.packages("ggplot2", repos='http://cran.us.r-project.org')
install.packages("plyr", repos='http://cran.us.r-project.org')
install.packages("reshape2", repos='http://cran.us.r-project.org')
install.packages("data.table", repos='http://cran.us.r-project.org')


