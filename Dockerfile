FROM ubuntu:20.04
LABEL description "Rstudio server"

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E298A3A825C0D65DFD57CBB651716619E084DAB9 && \
    add-apt-repository 'deb https://cloud.r-project.org/bin/linux/ubuntu focal-cran40/' && \
    apt-get update && apt-get install -y \
    r-base \
    build-essential \
    wget \
    gdebi-core \
    libhdf5-dev \
    libcurl4-gnutls-dev \
    libssl-dev \
    libxml2-dev \
    libpng-dev \
    libxt-dev \
    zlib1g-dev \
    libbz2-dev \
    liblzma-dev \
    libglpk40 \
    libgit2-28 \
    libudunits2-dev \
    libgdal-dev \
    libgeos-dev \
    libproj-dev

RUN wget https://download2.rstudio.org/server/bionic/amd64/rstudio-server-2022.02.1-461-amd64.deb && \
    gdebi -n rstudio-server-2022.02.1-461-amd64.deb && \
    rm -f rstudio-server-2022.02.1-461-amd64.deb

RUN Rscript -e "install.packages(c('rmarkdown', 'tidyverse', 'workflowr', 'BiocManager'));"

EXPOSE 8787

CMD ["/usr/lib/rstudio-server/bin/rserver", "--server-daemonize=0", "--server-app-armor-enabled=0"]
