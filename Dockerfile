FROM python:3.5.2

MAINTAINER @joshuacook

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
        python3-dev \
        rsync \
        software-properties-common \
        unzip \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN apt-get update && apt-get install -y libgtk2.0-0

RUN curl -O https://bootstrap.pypa.io/get-pip.py && \
    python get-pip.py && \
    rm get-pip.py

ADD https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh tmp/Miniconda3-latest-Linux-x86_64.sh
RUN bash tmp/Miniconda3-latest-Linux-x86_64.sh -b
ENV PATH $PATH:/root/miniconda3/bin/

COPY environment.yml  .
RUN conda install --yes pyyaml
RUN conda env create -f=environment.yml --name carnd_term_1

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Term 1 workdir
RUN mkdir /src
WORKDIR "/src"

# TensorBoard
EXPOSE 6006
# Jupyter
EXPOSE 8888
# Flask Server
EXPOSE 4567

## Two Birds, One Stone
# 1. sources conda environment
# 2. prevents the zombie container issue when started as pid 1
COPY run.sh /
RUN chmod +x /run.sh
ENTRYPOINT ["/run.sh"]
