#!/bin/bash

# Function to check if fzf is installed
check_fzf_installed() {
    if ! command -v fzf &> /dev/null
    then
        echo "fzf could not be found."
        echo "Please install fzf before running this script."
        echo "For Ubuntu/Debian: sudo apt-get install fzf"
        echo "For macOS: brew install fzf"
        exit 1
    fi
}

# Check if fzf is installed
check_fzf_installed
# Display available Docker images
images=$(docker images --format '{{.Repository}}:{{.Tag}}')
image_name=$(echo "$images" | fzf --prompt="Select Docker image: " --height=10 --reverse)

# Check if selection is made
if [ -n "$image_name" ]; then
    echo "You selected: $image_name"
else
    echo "No image selected."
	exit
fi

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
  -v /mnt:/mnt \
  --device /dev/kvm \
  --privileged \
  --shm-size="${memory_quota}g" \
  $image_name

# other options #

# -v [host_path]:[mounting_point_in_the_container]
# --gpus all / '"device=1"'
# enable kvm
# --device /dev/kvm \
# --security-opt seccomp=unconfined \
# --cap-add SYS_ADMIN \
# --cpus=$cpus_quota \
# --shm-size for pytorch DDP
