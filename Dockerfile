# DO NOT EDIT FILES CALLED 'Dockerfile'; they are automatically
# generated. Edit 'Dockerfile.in' and generate the 'Dockerfile'
# with the 'rake' command.

FROM harisekhon/ubuntu-java

# MAINTAINER maintainer@bioconductor.org

LABEL maintainer="Anthony Cesnik <cesnik@wisc.edu>"

############## PACKAGES ############

WORKDIR /usr/bin/local

RUN apt-get update -qq && apt-get -y --no-install-recommends install \
  ### installers
  wget \
  # curl \
  # gcc \   
  # g++ \
  # gfortran \
  # make \
  # cmake \
  # build-essential \
  # pkg-config \
  # maven \
  ### file compression
  # zlib1g-dev \ 
  # liblzo2-dev \
  # unzip \
  # liblzma-dev \
  # libncurses5-dev \
  # libbz2-dev \
  ### commandline tools
  # gawk \ 
  # git \
  # python \
  # python-pip \
  # r-base-core \
  # python-dev \
  # python3-dev \
  # python-setuptools \
  # libpython2.7-dev \
  # perl-doc \
  ### cpanm requirements, required for STAR-Fusion
  # libxi-dev \ 
  # libxmu-dev \
  # freeglut3-dev \
  # libgsl0-dev \
  # libnetpbm10-dev \
  # libplplot-dev \
  # pgplot5 \
  # libdb5.3 \
  # libdb5.3-dev \
  ### python setup
  # && pip install --upgrade virtualenv pip qc bitsets cython numpy bx-python pysam RSeQC h5py scipy \ 
  ### perl setup
  # && curl -L http://cpanmin.us \ 
  # | perl - --sudo App::cpanminus \
  # && cpanm DB_File URI::Escape Set::IntervalTree Carp::Assert JSON::XS PerlIO::gzip \
  ### downloads
  && wget -q -O - https://ftp-trace.ncbi.nlm.nih.gov/sra/sdk/current/sratoolkit.current-ubuntu64.tar.gz | tar xz
  
RUN ls .

#####################################################################

CMD sratoolkit*/bin/fastq-dump --split-files $var1
