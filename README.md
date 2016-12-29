# CarND Term1 Starter Kit
[![Udacity - Self-Driving Car NanoDegree](https://s3.amazonaws.com/udacity-sdc/github/shield-carnd.svg)](http://www.udacity.com/drive)

The purpose of this project is to provide unified software dependency support for students enrolled in Term 1 of the [Udacity Self-Driving Car Engineer Nanodegree](https://www.udacity.com/course/self-driving-car-engineer-nanodegree--nd013). 

Python 3 is used for entirety of term 1.

There are two ways to get up and running:

1. [Anaconda Environment](http://conda.pydata.org/docs/)  
    Get started [here](docs/configure_via_anaconda.md)
    - Supported Systems: 
         - Linux (CPU)
         - Mac (CPU)
         - Windows (CPU) 
     - pros:
         - more straight-forward to use
         - older technology
             - more community support (stack exchange, etc)
         - more heavily adopted
     - cons:
         - no GPU support in this project
         - no AWS support in this project
         - no C++ support in this project (not important until Term 2)
         - implementation is OS specific
         - work must be repeated in each computing environment (local, remote, etc)
2. [Docker](http://docker.com)  
    Get started [here](docs/configured_via_docker.md)
    - Supported Systems: 
        - Amazon Web Services (CPU, GPU)
        - Linux (CPU, GPU)
        - Mac (CPU)
        - Windows (CPU)
    - pros: 
        - platform agnostic
            - allows you to develop in the exact same way regardless of OS or whether you are local or remote
        - GPU support
        - AWS support
    - cons:
        - more challenging to use
        - newer technology
            - less community support
