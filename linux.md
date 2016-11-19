# CarND-TensorFlow-Lab Docker Install Recipe for Linux

## Step 1

First, follow the instructions to install Docker for your Linux distribution from https://docs.docker.com/engine/installation/linux/.

## Step 2

This step ensures docker is installed properly on your computer.

Launch `Terminal` and type the following at the prompt to download and launch the `hello-world` docker container (https://hub.docker.com/_/hello-world/):

```
docker run hello-world
```

You should now see the following confirming successful installation: 

```
docker run hello-world
Unable to find image 'hello-world:latest' locally
latest: Pulling from library/hello-world
c04b14da8d14: Pull complete
Digest: sha256:0256e8a36e2070f7bf2d0b0763dbabdd67798512411de4cdcf9431a1feb60fd9
Status: Downloaded newer image for hello-world:latest

Hello from Docker!
This message shows that your installation appears to be working correctly.

To generate this message, Docker took the following steps:
 1. The Docker client contacted the Docker daemon.
 2. The Docker daemon pulled the "hello-world" image from the Docker Hub.
 3. The Docker daemon created a new container from that image which runs the
    executable that produces the output you are currently reading.
 4. The Docker daemon streamed that output to the Docker client, which sent it
    to your terminal.
```

**NOTE**: No need to try something more ambitious. We have bigger fish to fry below. XD

## Step 3
 
In the same `Terminal` session, `git clone` the _CarND-TensorFlow-Lab_ repository:

```
git clone https://github.com/udacity/CarND-TensorFlow-Lab.git
cd CarND-TensorFlow-Lab
```

## Step 4

Once the repository has been cloned, you're ready to download, install and launch the _carnd-tensorflow-lab_ docker container.

`NOTE: Ensure you have at least 1.5 GB of available disk space to download the docker image.`

```
docker run -it -p 8888:8888 --rm -v `pwd`:/notebooks udacity/carnd-tensorflow-lab
```

If all goes well, it will fetch the image and extract it.  If it doesn't automatically launch jupyter when done, manually launch the notebook in your browser of choice via the following link.

Launch Jupyter notebook: http://localhost:8888/tree

That's it you're done!


### (Optional) How-to: Launch multiple Jupyter notebooks simultaneously

If you have the desire to launch more than one Jupyter notebook simultaneously, just change the local port number (the number on the left hand side of the colon) to something unique:

```
docker run -it -p 8889:8888 --rm -v `pwd`:/notebooks udacity/carnd-tensorflow-lab
```

Launch the secondary Jupyter notebook: http://localhost:8889/tree

**NOTE**: You will see the message "The Jupyter Notebook is running at: http://[all ip addresses on your system]:8888/" after executing the run command, however, the port is incorrect. Ensure you specify the correct port in the URL (in this case, it's 8889).
