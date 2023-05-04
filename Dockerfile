# Comments are from https://medium.com/bb-tutorials-and-thoughts/docker-a-beginners-guide-to-dockerfile-with-a-sample-project-6c1ac1f17490

# Pull base image.
FROM pytorch/pytorch:2.0.0-cuda11.7-cudnn8-runtime

# RUN executes the instructions in a new layer on top of the existing image 
# and commit those layers and the resulted layer will be used for 
# the next instructions in the Dockerfile.

# disable the keyboard-setting in the ubuntu while docker RUN
ENV DEBIAN_FRONTEND=noninteractive

RUN \
    apt update && \
    apt -y upgrade && \
    apt install -y build-essential && \
    apt install -y vim zsh unzip htop wget xrdp tmux git && \
	apt install -y fail2ban && \
    apt install -y openssh-server && \
    env > /etc/environment


# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# CMD command is used to give the default commands when the image is instantiated (only once).
# It doesn’t execute while build stage. There should be only one CMD per Dockerfile, 
# you can list multiple but the last one will be executed.
CMD ["zsh"]
