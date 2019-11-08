# gpu-base

## Requirement

* docker 19.03+

## Testing Environment

* Ubuntu 18.04 LTS
* Nvidia GPU (GeForce GTX 1050)

```
$ lspci | grep -i nvidia
01:00.0 VGA compatible controller: NVIDIA Corporation GP107 [GeForce GTX 1050] (rev a1)
01:00.1 Audio device: NVIDIA Corporation GP107GL High Definition Audio Controller (rev a1)
```

## Get stated

Build `gpu-base:latest` Image (Base Image: [nvidia/cuda](https://hub.docker.com/r/nvidia/cuda))

```
$ make build
```

Allow xhost setting

```
// Allow local only
$ xhost + local:
non-network local connections being added to access control list

$ xhost
access control enabled, only authorized clients can connect
LOCAL:

// Disable Access Control(full access)
$ xhost +
access control disabled, clients can connect from any host
```

set the` DISPLAY` environment variable

```
// confirm DISPLAY environment variable
$ echo $DISPLAY

// set DISPLAY environment variable
$ export DISPLAY=:0
$ echo $DISPLAY
:0
```

The result of `nvidia-smi` is as follows

```
// Check that 'Driver Version' and 'CUDA Version' are displayed correctly
$ make smi
docker run --rm --gpus all gpu-base:latest nvidia-smi
Fri Nov  8 03:22:53 2019
+-----------------------------------------------------------------------------+
| NVIDIA-SMI 440.26       Driver Version: 440.26       CUDA Version: 10.2     |
|-------------------------------+----------------------+----------------------+
| GPU  Name        Persistence-M| Bus-Id        Disp.A | Volatile Uncorr. ECC |
| Fan  Temp  Perf  Pwr:Usage/Cap|         Memory-Usage | GPU-Util  Compute M. |
|===============================+======================+======================|
|   0  GeForce GTX 1050    Off  | 00000000:01:00.0  On |                  N/A |
| 40%   28C    P8    N/A /  75W |    152MiB /  1992MiB |      0%      Default |
+-------------------------------+----------------------+----------------------+

+-----------------------------------------------------------------------------+
| Processes:                                                       GPU Memory |
|  GPU       PID   Type   Process name                             Usage      |
|=============================================================================|
+-----------------------------------------------------------------------------+
```

## Benchmark

Using [glmark2](https://github.com/glmark2/glmark2)

```
$ make glmark
docker run --rm --gpus all -e DISPLAY=:0 -v /tmp/.X11-unix/:/tmp/.X11-unix gpu-base:latest glmark2
=======================================================
    glmark2 2014.03+git20150611.fa71af2d
=======================================================
    OpenGL Information
    GL_VENDOR:     NVIDIA Corporation
    GL_RENDERER:   GeForce GTX 1050/PCIe/SSE2
    GL_VERSION:    4.6.0 NVIDIA 440.26
=======================================================
```
