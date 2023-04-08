docker run -d --storage-opt size=100G --cpus=".8" --gpus all --memory=48g -v /mnt/data:/mnt/data -v /mnt/shared:/mnt/shared --name $1 eclgpu4_pytorch
