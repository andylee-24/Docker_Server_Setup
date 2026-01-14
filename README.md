# Docker Server Setup

### Docker server setup
A small script for providing multiple user accounts on a host machine using a CUDA Docker image.

### Setting up docker environment
1. Install [Docker](https://docs.docker.com/engine/install/)
2. Install nvidia drivers and [nvidia-container-toolkit](https://docs.nvidia.com/datacenter/cloud-native/container-toolkit/latest/install-guide.html)
3. Reboot the server to initialize GPU drivers
4. Pull or build the docker image from the Dockerfile: `docker build -t [TagName] -f [MyDockerFile] .`
   - For example, one can use ```nvidia/cuda:<cuda_version>-devel-ubuntu<os_version>``` to run applications using pytorch+cuda.
   - Run the script to start a container: `start_single_server_lim_disk.sh`.
   - When using NVIDIA’s CUDA image, you need to use the same CUDA version as the host.
* Ensure the disk is formatted as 'xfs' to enforce quota limits. For more details, refer to the [Docker documentation](https://docs.docker.com/reference/cli/dockerd/#overlay2-options).
* *Important update!* From Docker Engine 29.0+, Docker’s default image backend DOES NOT use ``overlay2`` anymore which is required to limit container disk quota by with xfs file system. Please refer the official document to [apply overlay2 setting to xfs disk](https://docs.docker.com/engine/storage/drivers/overlayfs-driver/).

### How to access and attach the container
* To access the container using ssh:  
`ssh [username]@[ip] -p [port_number]`
* Or you can attach the container using:  
`docker attach [container_name]`  
Press ```Ctrl+P``` ```Ctrl+Q``` to detatch the container. ```Ctrl+D```, will shutdown the container.


### Note
* If you're using ubuntu and face some cuda driver version mismatch issues after several days, try out uninstalling ```unattended-upgrades``` package.

### TODO
* todo...

### Special Thanks to...
[Jaehyun-Ko](https://github.com/jaehyun-ko)  
[mirageoasis](https://github.com/mirageoasis)  
[Dongjun Hwang](https://github.com/dongjunhwang)  
[myeee](https://github.com/mye280c37)
