
#!/bin/sh
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 [name] [port]"
	exit 1
fi

docker run \
  -itd \
  --restart unless-stopped \
  --ipc host \
  --gpus '"device=0"' \
  -v /mnt:/mnt \
  --name $1 \
  -p $2:22 \
  --device /dev/kvm \
  --privileged \
  --security-opt seccomp=unconfined \
  --cap-add SYS_ADMIN \
  gem5:1.0

# -v [host_path]:[mounting_point_in_the_container]
