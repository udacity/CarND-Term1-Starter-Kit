FROM nvidia/cuda:8.0-cudnn5-runtime-ubuntu16.04

MAINTAINER @joshuacook

# Pick up some TF dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        curl \
        libfreetype6-dev \
        libpng12-dev \
        libzmq3-dev \
        pkg-config \
	python \
        python3-dev \
        rsync \
        software-properties-common \
        unzip \
        libgtk2.0-0 \
        git \
	tcl-dev \
	tk-dev \	
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

ADD https://repo.continuum.io/miniconda/Miniconda3-4.4.10-Linux-x86_64.sh tmp/Miniconda3-4.4.10-Linux-x86_64.sh
RUN bash tmp/Miniconda3-4.4.10-Linux-x86_64.sh -b
ENV PATH $PATH:/root/miniconda3/bin/

COPY environment-gpu.yml  ./environment.yml
RUN conda env create -f=environment.yml --name carnd-term1 --debug -v -v

# cleanup tarballs and downloaded package files
RUN conda clean -tp -y

# Set up our notebook config.
COPY jupyter_notebook_config.py /root/.jupyter/

# Term 1 workdir
RUN mkdir /src
WORKDIR "/src"

# Make sure CUDNN is detected
ENV LD_LIBRARY_PATH /usr/local/cuda/lib64/:$LD_LIBRARY_PATH
RUN ln -s /usr/local/cuda/lib64/libcudnn.so.5 /usr/local/cuda/lib64/libcudnn.so

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
