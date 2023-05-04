
#!/bin/sh
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 [name] [port]"
	exit 1
fi

sudo docker run \
  -itd \
  --cpus="32" \
  --ipc host \
  --gpus all \
  --memory=48g \
  -v /mnt/sdb:/mnt/sdb \
  --name $1 \
  -p $2:22 \
  gpu_server:1.0

# -v [host_path]:[mounting_point_in_the_container]
