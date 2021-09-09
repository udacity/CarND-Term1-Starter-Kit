# Configure and Manage Your Environment with Anaconda

Per the Anaconda [docs](http://conda.pydata.org/docs):

> Conda is an open source package management system and environment management system 
for installing multiple versions of software packages and their dependencies and 
switching easily between them. It works on Linux, OS X and Windows, and was created 
for Python programs but can package and distribute any software.

## Overview
Using Anaconda consists of the following:

1. Install [`miniconda`](http://conda.pydata.org/miniconda.html) on your computer
2. Create a new `conda` [environment](https://conda.io/projects/conda/en/latest/user-guide/tasks/manage-environments.html) using this project
3. Each time you wish to work, activate your `conda` environment

---

## Installation

**Download** the latest version of `miniconda` that matches your system.

**NOTE**: There have been reports of issues creating an environment using miniconda `v4.3.13`. If it gives you issues try versions `4.3.11` or `4.2.12` from [here](https://repo.continuum.io/miniconda/).

|        | Linux | Mac | Windows | 
|--------|-------|-----|---------|
| 64-bit | [64-bit (bash installer)][lin64] | [64-bit (bash installer)][mac64] | [64-bit (exe installer)][win64]
| 32-bit | [32-bit (bash installer)][lin32] |  | [32-bit (exe installer)][win32]

[win64]: https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86_64.exe
[win32]: https://repo.continuum.io/miniconda/Miniconda3-latest-Windows-x86.exe
[mac64]: https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
[lin64]: https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
[lin32]: https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86.sh

**Install** [miniconda](http://conda.pydata.org/miniconda.html) on your machine. Detailed instructions:

- **Linux:** https://conda.io/en/latest/miniconda.html#linux-installers
- **Mac:** https://conda.io/en/latest/miniconda.html#macosx-installers
- **Windows:** https://conda.io/en/latest/miniconda.html#windows-installers

**Setup** the `carnd-term1` environment. 

```sh
git clone https://github.com/udacity/CarND-Term1-Starter-Kit.git
cd CarND-Term1-Starter-Kit
```

If you are on Windows, **rename**   
`meta_windows_patch.yml` to   
`meta.yml`

**Create** carnd-term1.  Running this command will create a new `conda` environment that is provisioned with all libraries you need to be successful in this program.
```
conda env create -f environment.yml
```

*Note*: Some Mac users have reported issues installing TensorFlow using this method. The cause is unknown but seems to be related to `pip`. For the time being, we recommend opening environment.yml in a text editor and swapping
```yaml
    - tensorflow==0.12.1
```
with
```yaml
    - https://storage.googleapis.com/tensorflow/mac/cpu/tensorflow-0.12.1-py3-none-any.whl
```
If you have encountered a No module named 'requests' error, try to add in a line under 'pip' line in the environment.yml in a text editor

with
```yaml
    - requests
```
*Note*: In Project Behavioral Cloning, classroom workspaces has Keras==2.2.4 version and in Project Traffic Sign Classifier classroom workspaces has Keras==2.0.9. To install Keras==2.2.4 we would recommend opening environment.yml in a text editor and swapping
```yaml
    - keras==2.0.9
```
with

```yaml
    - keras==2.2.4
```
or write
```
    pip install keras==2.2.4
```
**Verify** that the carnd-term1 environment was created in your environments:

```sh
conda info --envs
```

**Cleanup** downloaded libraries (remove tarballs, zip files, etc):

```sh
conda clean -tp
```

### Uninstalling 

To uninstall the environment:

```sh
conda env remove -n carnd-term1
```

---

## GPU Installation

Prior to installing tensorflow-gpu for Ubuntu or Windows as part of the Anaconda environment for Nvidia GPUs, install the appropriate versions of CUDA Toolkit and cuDNN, along with the necessary Nvidia drivers. See Ubuntu instructions [here](https://www.tensorflow.org/install/gpu#linux_setup) and Windows instructions [here](https://www.tensorflow.org/install/gpu#windows_setup).

When creating the environment, at the **Create** step above, change the command to:
```
conda env create -f environment-gpu.yml
```
Otherwise, follow the same steps as above.

---

## Using Anaconda

Now that you have created an environment, in order to use it, you will need to activate the environment. This must be done **each** time you begin a new working session i.e. open a new terminal window. 

**Activate** the `carnd-term1` environment:

### OS X and Linux
```sh
$ source activate carnd-term1
```
### Windows
Depending on shell either:
```sh
$ source activate carnd-term1
```
or

```sh
$ activate carnd-term1
```

That's it. Now all of the `carnd-term1` libraries are available to you.

To exit the environment when you have completed your work session, simply close the terminal window.
