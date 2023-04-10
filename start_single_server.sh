
#!/bin/sh
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 [name] [port]"
	exit 1
fi

sudo docker run \
  -itd \
  --cpus=".8" \
  --ipc host \
  --gpus all \
  --memory=48g \
  -v /mnt/data:/mnt/data \
  -v /mnt/shared:/mnt/shared \
  --name $1 \
  -p $2:22 \
  gpu_pytorch:1.0
