# gpu-base

## Requirement

* docker 19.03+

## Testing Environment

* Ubuntu 18.04 LTS
* Nvidia GPU (MSI GTX1050)

## Get stated

Build `gpu-base:latest` Image

```
$ make build
```

Allow xhost setting

```
// Allow local only
$ xhost local:
non-network local connections being added to access control list

$ xhost
access control enabled, only authorized clients can connect
LOCAL:

// Disable Access Control(full access)
$ xhost +
access control disabled, clients can connect from any host
```

If `xhost:  unable to open display ""` is displayed, set the` DISPLAY` environment variable

```
// confirm display list
$ (cd /tmp/.X11-unix && for x in X*; do echo ":${x#X}"; done)
:0

// set DISPLAY environment variable
$ export DISPLAY=:0
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
```
