FROM rocker/rstudio:4.4.2

ENV DEBIAN_FRONTEND=noninteractive

RUN set -eux; \
  apt-get update; \
  apt-get install -y --no-install-recommends \
    libssl-dev \
    libcurl4-gnutls-dev \
    libxml2-dev \
    ca-certificates \
    gfortran \
    cmake \
    libgit2-dev \
    libfontconfig1-dev \
    libfreetype6-dev \
    libpng-dev \
    libjpeg-dev \
    libtiff5-dev \
    libcairo2-dev \
    libxt-dev \
    librsvg2-dev \
    libudunits2-dev \
  ; \
  rm -rf /var/lib/apt/lists/*

RUN set -eux; \
  R -q -e "options(repos=c(CRAN='https://packagemanager.rstudio.com/cran/__linux__/jammy/latest')); \
           install.packages(c('tidyquant','plotly'), dependencies=TRUE)"

EXPOSE 8787
CMD ["/init"]

