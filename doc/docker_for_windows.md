# Docker for Windows
### CarND Programming Environment - Installation Instructions


## Step 1: Install Docker

First, follow the instructions to install Docker for Windows from https://docs.docker.com/docker-for-windows.

The Stable Channel is recommended.

**NOTE**: Ensure you have at least 2 GB of free ram. Use the Windows Task Manager to close any programs which are using too much memory.

**NOTE**: press OK if prompted to enable Hyper-V during Docker install.  If you have VirtualBox installed, it will no longer work after Hyper-V is enabled.

**NOTE**: Restart your computer when prompted.

## Step 2: Configure Your System

Open Docker Settings:

![Docker Settings](https://docs.docker.com/docker-for-windows/images/whale-systray.png)

1. Select Shared Drives and make sure to share your `C:` drive (or the drive where
   you keep your carnd source code).
1. If necessary, disable your firewall or create an exception.
1. Allocate at least 2 CPUs and at least 2GB of Ram to Docker

## Step 3: `docker run hello-world`

This step ensures Docker is installed properly on your computer.

Launch `Windows PowerShell` and type the following at the prompt.
This will implicitly pull and then and run the `hello-world` Docker image
(https://hub.docker.com/_/hello-world/) in a new container:

```sh
$ docker run hello-world
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

That's it!!
