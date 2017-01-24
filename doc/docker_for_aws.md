# Docker For AWS

### AWS Credentials

Prior to following this tutorial, you will need to have configured your AWS
command line interface [with the proper credentials](aws_configure_credentials.md). 

### `aws` Command Line Interface

You will also need to have the `aws` command line interface installed. You can
do that using `pip` by [following these instructions](http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-with-pip).

## GPU on AWS

The general workflow herein supported consists of the following:

1. Do development work on your project locally using the standard docker image
1. Sync this work with your github account
1. Start a new GPU instance on AWS using `docker-machine` with its built-in EC2 
   driver
1. SSH into the GPU instance using `docker-machine`
1. Use `nvidia-docker` tool to run the GPU configured docker image


### Local Development & Sync with Github

Note that this means sync to your personal github account. 

1. Develop your work locally and manage it using `git`
    - develop your work locally using your standard workflow 
      (python modules/scripts, jupyter notebook)
    - `git add -A && git commit -m 'Standard commit message'`
1. Push local changes to github
    - `git push`

### Start a new GPU instance

**WARNING:** This is the phase at which you will start to accrue costs. Running
this command will start a GPU instance on AWS. 

To manage your GPU instance, you will be using three basic commands:

1. `docker-machine create`
   - creates a new docker host machine
1. `docker-machine ls`
   - lists all running docker host machines
1. `docker-machine rm`
   - removes a docker host machine 
   
**Make sure not to leave your GPU instance running. Always use `docker-machine rm` 
to destroy your instance when you are not using it.**  

1. [Configure the `jupyter` security group](aws_create_security_group.md).

1. Create an EC2 GPU instance. 

   ```
   docker-machine create --driver amazonec2 \
                         --amazonec2-region us-west-2 \
                         --amazonec2-ami ami-a9d276c9 \
                         --amazonec2-security-group jupyter \
                         --amazonec2-instance-type g2.2xlarge \
                         udacity-carnd-gpu
   ```
   
   You may run into the error:
   
   ```
   Error with pre-create check: "There is already a keypair with the name 
   udacity-carnd-gpu. Please either remove that keypair or use a different 
   machine name."
   ```
   
   This is an error with AWS. You can either change the name you wish to use or 
   navigate to *EC2 > Network & Security > Key Pairs* and remove the key pair
   with the conflicting name. 
   
1. Provision your new EC2 GPU instance for running `nvidia-docker`

   If you create a custom [AMI](http://docs.aws.amazon.com/AWSEC2/latest/UserGuide/AMIs.html), you can skip steps
   2 and 3 in the future.

   1. SSH into your instance
   
      ```
      (LOCAL) $ docker-machine ssh udacity-carnd-GPU
      ``` 
   1. Configure your instance for `nvidia-docker`
   
      ```
      (EC2-GPU) $ sudo apt-key adv --fetch-keys http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64/7fa2af80.pub
      (EC2-GPU) $ sudo sh -c 'echo "deb http://developer.download.nvidia.com/compute/cuda/repos/ubuntu1604/x86_64 /" > /etc/apt/sources.list.d/cuda.list'
      (EC2-GPU) $ sudo apt-get update && sudo apt-get install -y --no-install-recommends cuda-drivers
      ```

   1. Install [nvidia-docker](https://github.com/NVIDIA/nvidia-docker#quick-start)
      
   1. Run the test image
   
      ```
      (EC2-GPU) $ sudo nvidia-docker run --rm nvidia/cuda nvidia-smi
      ```
      
      After the image is finished pulling, you should see the following:
      
      ```
      Status: Downloaded newer image for nvidia/cuda:latest
      Wed Dec 28 00:04:07 2016
      +-----------------------------------------------------------------------------+
      | NVIDIA-SMI 367.57                 Driver Version: 367.57                    |
      |-------------------------------+----------------------+----------------------+
      | GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
      | Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
      |===============================+======================+======================|
      |   0  GRID K520           Off  | 0000:00:03.0     Off |                  N/A |
      | N/A   29C    P8    18W / 125W |      0MiB /  4036MiB |      0%      Default |
      +-------------------------------+----------------------+----------------------+
      
      +-----------------------------------------------------------------------------+
      | Processes:                                                       GPU Memory |
      |  GPU       PID  Type  Process name                               Usage      |
      |=============================================================================|
      |  No running processes found                                                 |
      +-----------------------------------------------------------------------------+
      ```
1. Use `nvidia-docker` to launch a new carnd image with GPU support.


