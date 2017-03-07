# Configure and Manage Your Environment with Docker

Per the Docker [docs](https://www.docker.com/what-docker):

> Docker containers wrap a piece of software in a complete filesystem that contains everything needed to run: code, runtime, system tools, system libraries – anything that can be installed on a server. This guarantees that the software will always run the same, regardless of its environment.

## Overview

Using Docker to run your code consists of the following:

1. Install Docker on your computer or a remote system
2. Pull the precompiled Docker image from Docker Hub
3. Each time you wish to work, run the image as a new container

The tricky part to working with Docker will be accessing your project code while working with a Python process (via Jupyter, Python, or IPython) running in a container. 

### GPU support

GPU Support is available for AWS using `nvidia-docker`. Start [here](docker_for_aws.md). 

---


### Install Docker On Your Computer

Instructions for installation vary by operating system and version.



| OS                                       | Installation<br>Instruction               | Docker System               | Shell                      | Access Jupyter at |
|:-----------------------------------------|:-----------------------------------------:|:----------------------------|:--------------------------:|:-----------------:|
| Linux                                    | [Here](docker_for_linux.md)           | Docker for Linux            | `bash`                     | `localhost:8888`  |
| MacOS <br>>= 10.10.3 (Yosemite)              | [Here](docker_for_mac.md)             | Docker for Mac              | `bash`                     | `localhost:8888`  |
| MacOS <br>>= 10.8 (Mountain Lion)            | [Here](docker_toolbox_for_mac.md)     | Docker Toolbox for Max      | Docker Quickstart Terminal | `#DOCKERIP:8888`  |
| Windows <br>10 Pro, Enterprise, or Education | [Here](docker_for_windows.md)         | Docker for Windows          | `Windows PowerShell`       | `localhost:8888`  |
| Windows <br>7, 8, 8.1, or 10 Home            | [Here](docker_toolbox_for_windows.md) | Docker Toolbox for Windows  | Docker Quickstart Terminal | `#DOCKERIP:8888`  |

---

### Pull the Precompiled Docker Image from Docker Hub

A precompiled image with all dependencies required for the first 
term is available on [Docker Hub][carnd_docker_hub].

Once you have docker working, pull the image using the following command:

```sh
docker pull udacity/carnd-term1-starter-kit
```

### Run The Image as a New Container

In your shell, navigate to the directory of a project, e.g.

```bash
$ cd ~/src/CarND-LaneLines-P1
```

From within this directory, you are going to run a Jupyter server. In order
to do this you must attach to the correct port and share a local volume.

The easiest way to share a local volume is via the `pwd` command, a shell
command that prints the working directory. This command will be used
differently based on your shell.

If you're using `Windows PowerShell`:

```sh
docker run -it --rm -p 8888:8888 -v ${pwd}:/src udacity/carnd-term1-starter-kit
```

If you're using `bash` or Docker Quickstart Terminal:

```sh
docker run -it --rm -p 8888:8888 -v `pwd`:/src udacity/carnd-term1-starter-kit
```

Let's break this down.

`docker run` is the command a startup and run a Docker container.

`-it` forces the container to run in the foreground (interactive mode) and
provides an I/O to the container.

`--rm` removes the container once it stops running.
It prevents the buildup of stale containers once you stop them from running.

`-p 8888:8888` maps port 8888 on our local machine to port 8888 in the Docker
container, this allows us to access port 8888 in the container
by visiting `localhost:8888`.

`-v ${pwd}:/src` mounts the pwd (present working directory) to the /src
directory in the container. Basically, this lets us access files
from our local machine on the docker container.

`udacity/carnd-term1-starter-kit` is the name of the container to run.

To learn more about Docker [visit the docs](https://docs.docker.com/engine/userguide/intro/).

[carnd_docker_hub]: https://hub.docker.com/r/udacity/carnd-term1-starter-kit/

#### For Windows

Use the ip address of the container to connect to Jupyter notebook, this can be found by opening another 
docker terminal and running this command: `docker-machine ip default`. Jupyter server can then be accessed
by going to this page from your browser: `http://[ip-of-container]:8888`.
