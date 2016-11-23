# CarND Term1 Starter Kit

**WIP**

Software for Term 1 of the [Udacity Self-Driving Car Engineer Nanodegree](https://www.udacity.com/course/self-driving-car-engineer-nanodegree--nd013).

Python 3 is used for entirety of the nanodegree.

## MacOS/Linux

Install [miniconda](http://conda.pydata.org/miniconda.html) on your machine.

Next, setup the CarND Term1 environment.

To install:

```sh
git clone https://github.com/domluna/CarND-Term1-Starter-Kit.git
cd CarND-Term1-Starter-Kit
conda env create -f=environment.yml
```

To use:

```sh
source activate carnd-term1 # enter the environment
source deactivate # exit the environment
```

To uninstall:

```sh
conda env remove -n carnd-term1
# removes cached libraries
conda clean -tp
```

### Install Tensorflow for GPU

The current setup only installs the CPU version of TensorFlow. If you wish to use the GPU version follow the instructions [here](https://www.tensorflow.org/get_started).

## Windows (via Docker)

NOTE: You could also use this Docker container for MacOS or Linux.

In the directory of this repository run the following:

```sh
# Builds the docker container. This may take a few minutes.
docker build -t carnd-term1 .
```

To run the container, navigate to the directory of a project and run the follwing:

```sh
docker run -it --rm -p 8888:8888 -v `pwd`:/src carnd-term1
```

Let's break this down.

`docker run` is the command a startup and run a Docker container. 

`-it` forces the container to run in the foreground (interactive mode) and provides an I/O to the container. 

`--rm` removes the container once it stops running. You may run into an error if you start the container and it's already running, this ensures that won't happen. 

`-p 8888:8888` maps port 8888 on our local machine to port 8888 in the Docker container, this allows us to access port 8888 in the container by visiting `localhost:8888`.

`-v `pwd`:/src` mounts the pwd (present working directory) to the /src directory in the container. Basically, this let's us access files from our local machine on the docker container.

`carnd-term1` is the name of the container to run.

To learn more about Docker [visit the docs](https://docs.docker.com/engine/userguide/intro/).

