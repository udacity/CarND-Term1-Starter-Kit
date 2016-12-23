# Docker For AWS

1. using CPU
1. using GPU

## Steps to Implementation

### Local Work Prior to Deploying to AWS
1. Develop your work locally and manage it using `git`
    - develop your work locally using your standard workflow (python modules/scripts, jupyter notebook)
    - `git add -A && git commit -m 'Standard commit message'`
1. Push local changes to github
    - `git push`
1. Write a `Dockerfile` to implement your own Docker Image
    - add a layer to the Udacity image that contains your work
    ```
    FROM udacity/carnd-term1-starter-kit
    RUN git clone https://github.com/#YOUR_USERNAME#/#YOUR_REPO#.git
    ```
1. Build the `Dockerfile` for your own Docker Image
   - `$ docker build -t my_carnd_image .` 
   - Make sure you include everything here, the period `.` included.

### Create a Machine on AWS

We will be using `docker-machine` with its built-in EC2 driver to create a machine on Amazon Web Services 
that is ready to run our Docker image remotely. We will then configure our `docker` command line tool to point
at this machine and run a container based upon the image you just built.

#### `aws` Command Line Interface

It is recommended that you have the `aws` command line interface installed. You can do that using `pip` by 
[folliwing these instructions](http://docs.aws.amazon.com/cli/latest/userguide/installing.html#install-with-pip).

#### AWS Credentials

You will need to make sure that you have your AWS credentials stored in a `~/.aws/credentials`. This will
most likely look something like

```
[default]
aws_access_key_id = AKID1234567890
aws_secret_access_key = MY-SECRET-KEY
```

If you have installed the command line interface, you can configure your system easily using

```
$ aws configure
```

More details with regard to this can be found [here](http://docs.aws.amazon.com/cli/latest/userguide/cli-chap-getting-started.html).

Verify your credentials by listing your running EC2 instances using

```
aws ec2 describe-instances
```

1. Create a new Docker Machine on AWS

   ```
   $ docker-machine create --driver amazonec2 aws-sandbox
   ```

1. Connect your `docker` client to the remote AWS instance

   ```
   $ eval $(docker-machine env aws-sandbox)
   ```

1. Find the IP address of your AWS container

   ```
   $ docker-machine ip aws-sandbox
   ```

1. View your running machine

   ```
   $ docker-machine ls
   ```

1. Run an instance of your Docker Image on AWS

   ```
   $ docker run  ...
   ```

1. Run and Develop your work remotely on AWS and manage it using `git`
