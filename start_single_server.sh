docker run \
  -itd \
  --storage-opt size=100G \
  --cpus=".8" \
  --gpus all \
  --memory=48g \
  -v /mnt/data:/mnt/data \
  -v /mnt/shared:/mnt/shared \
  --name $1 \
  -p $2:22 \
  eclgpu4_pytorch
