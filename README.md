# Docker Server Setup

1. Install [Docker](https://docs.docker.com/engine/install/)
2. Install nvidia drivers and nvidia-container-toolkit
3. Reboot for initializing GPU drivers
4. Pull or build the docker image from the Dockerfile
	* docker build -t gpu\_server:1.0 .
5. Run and attach the container
6. Enable the ssh service ```service ssh start```
7. ```ssh [username]@[ip] -p [port number]```
8. Press ```Ctrl+P``` ```Ctrl+Q``` to detatch the container

### TODO
* Limit the disk R/W rate per container

### Special Thanks to...
[Jaehyun-Ko](https://github.com/jaehyun-ko)  
[mirageoasis](https://github.com/mirageoasis)  
[Dongjun Hwang](https://github.com/dongjunhwang)  
[myeee](https://github.com/mye280c37)
