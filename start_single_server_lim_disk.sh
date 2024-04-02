
#!/bin/sh
if [ "$#" -ne 2 ]; then
	echo "Usage: $0 [name] [port]"
	exit 1
fi

docker run \
  -itd \
  --restart unless-stopped \
  --storage-opt size=512g \
  --cpus="32" \
  --ipc host \
  --gpus all \
  --memory=128g \
  -v /mnt:/mnt \
  --name $1 \
  -p $2:22 \
  # --device /dev/kvm \
  # --security-opt seccomp=unconfined \
  # --cap-add SYS_ADMIN \
  pytorch2.2.0:latest

# -v [host_path]:[mounting_point_in_the_container]
# --gpus all / '"device=1"'
# enable kvm
