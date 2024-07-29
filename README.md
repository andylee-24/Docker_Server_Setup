# Docker Server Setup

### Setting up docker environment
1. Install [Docker](https://docs.docker.com/engine/install/)
2. Install nvidia drivers and nvidia-container-toolkit
3. Reboot to initialize GPU drivers
4. Pull or build the docker image from the Dockerfile:  
   `docker build -t [TagName] -f [MyDockerFile] .`  
   Or you can run the script `start_single_server_lim_disk.sh`
* Ensure the disk is formatted as 'xfs' to enforce quota limits. For more details, refer to the [Docker documentation](https://docs.docker.com/reference/cli/dockerd/#overlay2-options).

### How to access and attach the container
* To access the container using ssh:  
`ssh [username]@[ip] -p [port_number]`
* Or you can attach the container using:  
`docker attach [container_name]`  
Press ```Ctrl+P``` ```Ctrl+Q``` to detatch the container.  
If you use ```Ctrl+D```, the container will terminate

### TODO
* Limit the disk R/W rate per container

### Special Thanks to...
[Jaehyun-Ko](https://github.com/jaehyun-ko)  
[mirageoasis](https://github.com/mirageoasis)  
[Dongjun Hwang](https://github.com/dongjunhwang)  
[myeee](https://github.com/mye280c37)
