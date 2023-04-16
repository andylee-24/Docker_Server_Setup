
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

# -v [host_path]:[mounting_point_in_the_container]
# If you run the conatiner in the 2-CPU machine, then --cpus=".8" allocates 80% of the SINGLE cpu,
# --cpus="1.6" will do 80% of the ENTIRE cpus.
