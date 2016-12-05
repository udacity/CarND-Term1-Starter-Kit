# Windows 10
### CarND Programming Environment - Installation Instructions


## Step 1

First, download the most stable version of Docker for Windows from https://docs.docker.com/docker-for-windows

**TIP**: Docker for Windows does not currently run on Windows 10 Home Edition.  It requires the Pro, Enterprise, or Education edition.  Read Docker's [What to know before you install](https://docs.docker.com/docker-for-windows/#/what-to-know-before-you-install) document to learn more.

**TIP**: Ensure you have at least 2 GB of free ram. Use the Windows Task Manager to close any programs which are using too much memory.

**TIP**: press OK if prompted to enable Hyper-V during Docker install.  If you have VirtualBox installed, it will no longer work after Hyper-V is enabled.

**TIP**: Restart your computer when prompted.


## Step 2

This step ensures Docker is installed properly on your computer.

Launch `Windows PowerShell` and type the following at the prompt to download and launch the `hello-world` Docker container (https://hub.docker.com/_/hello-world/):

```
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

**NOTE**: No need to try something more ambitious. We have bigger fish to fry below. XD


## Step 3
##### Enable C Drive Sharing

 Open the Docker task tray's *Settings...* dialogue and ensure _Shared_ is checked for the `C` drive.
 
 https://docs.docker.com/docker-for-windows/#/docker-settings
 
```Docker tray icon > Settings... > Shared Drives > check "Shared" checkbox next to C drive```
 
##### Firewall issues

You may be told your Windows firewall is preventing you from doing this.
If this is the case, you need to either turn off the firewall or create an exception.