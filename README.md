# CarND Term1 Starter Kit

Software for Term 1 of the [Udacity Self-Driving Car Engineer Nanodegree](https://www.udacity.com/course/self-driving-car-engineer-nanodegree--nd013).

Python 3 is used for entirety of the nanodegree.

## MacOS/Linux

Install [base Anaconda](http://conda.pydata.org/miniconda.html) on your machine.

Next, setup the CarND Term1 environment.

To install:

```sh
conda env create -f=environment.yml
```

To use:

```sh
source activate CarND-Term1 # enter the environment
source deactivate # exit the environment
```

To uninstall:

```sh
conda env remove -n CarND-Term1
# removes cached libraries
conda clean -tp
```

### Install Tensorflow for GPU

The current setup only installs the CPU version of TensorFlow. If you wish to use the GPU version follow the instructions [here](https://www.tensorflow.org/get_started).

## Windows

Docker stuff
