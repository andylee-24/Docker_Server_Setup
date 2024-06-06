#!/bin/bash


# Display available Docker images
echo "Available Docker images are below,"
docker images

# Prompt user to select an image
echo -n "Enter the name:tag of the Docker image: "
read image_name

# Prompt user for container name
echo -n "Container Name : "
read container_name

# Prompt user for port number
echo -n "Port : "
read port_number

# Prompt user for CPU quota
# max_cpus=$(nproc)
# echo -n "CPUs quota	(up to $max_cpus) : "
# read cpus_quota

# Prompt user for memory quota
echo -n "Memory quota (GB) : "
read memory_quota


# Prompt user for storage qutoa
echo -n "Storage quota (GB) : "
read storage_quota


docker run \
  -itd \
  --restart always \
  --storage-opt size="${storage_quota}g" \
  --memory="${memory_quota}g" \
  --gpus all \
  --name $container_name \
  -p $port_number:22 \
  -v /mnt/nvme_dataset:/mnt/dataset \
  --device /dev/kvm \
  --privileged \
  --shm-size="${memory_quota}g" \
  $image_name

echo "Successfully created"

# other options #

# -v [host_path]:[mounting_point_in_the_container]
# --gpus all / '"device=1"'
# enable kvm
# --device /dev/kvm \
# --security-opt seccomp=unconfined \
# --cap-add SYS_ADMIN \
# --cpus=$cpus_quota \
# --shm-size for pytorch DDP
