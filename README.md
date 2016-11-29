# CarND Term1 Starter Kit (WIP, but works pretty well)

Software for Term 1 of the [Udacity Self-Driving Car Engineer Nanodegree](https://www.udacity.com/course/self-driving-car-engineer-nanodegree--nd013).

Python 3 is used for entirety of the nanodegree.

There are two ways to get up and running:

1. Docker (MacOS/Linux/Windows)
2. Anaconda Environment (MacOS/Linux)

TensorFlow doesn't currently natively work on Windows which is why Docker is preferred method.

## Docker

### Download Docker

Follow the instructions for your OS.

* [MacOS](./macos.md)
* [Linux](./linux.md)
* [Windows](./windows.md)

### Building the Image

Download the prebuilt image directly from [Docker Hub](https://hub.docker.com/r/udacity/carnd-term1-starter-kit/)

```sh
docker pull udacity/carnd-term1-starter-kit
```

### Running a Container

To run the container, navigate to the directory of a project and run the follwing:

If you're on Windows:

```sh
docker run -it --rm -p 8888:8888 -v ${pwd}:/src udacity/carnd-term1-starer-kit
```

If you're on Mac or Linux:

```sh
docker run -it --rm -p 8888:8888 -v `pwd`:/src udacity/carnd-term1-starer-kit
```

Let's break this down.

`docker run` is the command a startup and run a Docker container. 

`-it` forces the container to run in the foreground (interactive mode) and provides an I/O to the container. 

`--rm` removes the container once it stops running. You may run into an error if you start the container and it's already running, this ensures that won't happen. 

`-p 8888:8888` maps port 8888 on our local machine to port 8888 in the Docker container, this allows us to access port 8888 in the container by visiting `localhost:8888`.

`-v ${pwd}:/src` mounts the pwd (present working directory) to the /src directory in the container. Basically, this let's us access files from our local machine on the docker container.

`udacity/carnd-term1-starer-kit` is the name of the container to run.

To learn more about Docker [visit the docs](https://docs.docker.com/engine/userguide/intro/).

### GPU support

The current image does not support GPU use. An image with GPU support is in the works.

## Anaconda

Install [miniconda](http://conda.pydata.org/miniconda.html) on your machine.

Next, setup the CarND term 1 environment.

To install:

```sh
git clone https://github.com/udacity/CarND-Term1-Starter-Kit.git
cd CarND-Term1-Starter-Kit
conda env create -f=environment.yml
```

To use:

```sh
source activate carnd-term1 # enter the environment
source deactivate # exit the environment
```

To cleanup downloaded libraries (remove tarballs, zip files, etc):

```sh
conda clean -tp
```

To uninstall the environment:

```sh
conda env remove -n carnd-term1
```

### Install Tensorflow for GPU

The current setup only installs the CPU version of TensorFlow. If you wish to use the GPU version follow the instructions [here](https://www.tensorflow.org/get_started).
