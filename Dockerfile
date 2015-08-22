FROM jupyter/notebook
# NOTE: Taken from: https://bitbucket.org/robLuke/ijulia

# The following would be required to enable exporting of ipynbs but creates too large an image for docker hub
# TODO: how to enable adjustbox without pulling down 3G of data
RUN apt-get update && apt-get install -y inkscape   # For nbconvert to work with svg
# RUN apt-get update && apt-get install -y texlive-latex-base   # For creating pdfs via latex
# RUN apt-get update && apt-get install -y texlive-latex-extra   # required for adjustbox.sty, probably is an easier way
RUN apt-get clean

# Install new version of R
RUN sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E084DAB9
RUN echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list

RUN cat /etc/apt/sources.list

# Install R
RUN apt-get update && apt-get install -y r-base
RUN apt-get update && apt-get install -y libzmq3-dev # https://github.com/IRkernel/IRkernel
RUN apt-get update && apt-get install -y libcurl4-gnutls-dev # http://stackoverflow.com/questions/26445815/error-when-installing-devtools-package-for-r-in-ubuntu
RUN apt-get update && apt-get install -y libcurl4-openssl-dev # http://stackoverflow.com/questions/20671814/non-zero-exit-status-r-3-0-1-xml-and-rcurl
RUN apt-get update && apt-get install -y libxml2-dev # http://stackoverflow.com/questions/20671814/non-zero-exit-status-r-3-0-1-xml-and-rcurl
RUN apt-get clean

# Install R packages
COPY installRPackages.R /sbin/installRPackages.R
RUN chmod +x /sbin/installRPackages.R
RUN /sbin/installRPackages.R

WORKDIR "/"
RUN mkdir /workspace

EXPOSE 8888
VOLUME /workspace

RUN mkdir /root/.ssh
VOLUME /root/.ssh

# https://github.com/ipython/ipython/issues/7062
CMD sh -c "ipython notebook --ip=*"
