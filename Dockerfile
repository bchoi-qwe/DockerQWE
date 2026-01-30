FROM rocker/rstudio:latest

RUN apt-get update && apt-get install -y --no-install-recommends \
    libssl-dev \
    libcurl4-gnutls-dev \
    libxml2-dev \
    libfontconfig1-dev \
    gfortran \
    cmake \
    libabsl-dev \
    libudunits2-dev \
    libcairo2-dev \
    libxt-dev \
    librsvg2-dev \
    libharfbuzz-dev \
    libfribidi-dev \
  && rm -rf /var/lib/apt/lists/*

RUN R -e "install.packages(c('tidyquant','plotly'), dependencies=TRUE, repos='https://packagemanager.rstudio.com/cran/latest')"

EXPOSE 8787
CMD ["/init"]
