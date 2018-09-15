# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

# The suggested name for this image is: bioconductor/release_core.

FROM bioconductor/release_base2

# MAINTAINER maintainer@bioconductor.org

LABEL maintainer="Jean-Yves Sgro <jsgro@wisc.edu>"
LABEL credit="Mark E. Berres<meberres@wisc.edu>"


#####################################################################
# ADD LIBRARIES HOPEFULLY TO HELP CAIRO TO INSTALL PROPERLY
# FROM DOCKER FILE IN https://hub.docker.com/r/rocker/tidyverse/~/dockerfile/
#
# ALSO  ADD libxt-dev based on info
# at https://groups.google.com/forum/#!topic/rapache/35lY7B6Wwrk

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  libxml2-dev \
  libcairo2-dev \
  libsqlite3-dev \
  libmariadbd-dev \
  libmariadb-client-lgpl-dev \
  libpq-dev \
  libssh2-1-dev \
  unixodbc-dev \
  libxt-dev 

#####################################################################

ADD install.R /tmp/

# invalidates cache every 24 hours
ADD http://master.bioconductor.org/todays-date /tmp/

RUN R -f /tmp/install.R
