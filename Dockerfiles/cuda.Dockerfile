# Comments are from https://medium.com/bb-tutorials-and-thoughts/docker-a-beginners-guide-to-dockerfile-with-a-sample-project-6c1ac1f17490

# Pull base image.
FROM nvidia/cuda:12.6.3-cudnn-devel-ubuntu24.04

# RUN executes the instructions in a new layer on top of the existing image
# and commit those layers and the resulted layer will be used for
# the next instructions in the Dockerfile.

# disable the keyboard-setting in the ubuntu while docker RUN
ENV DEBIAN_FRONTEND=noninteractive

RUN \
            apt update && \
            apt -y upgrade && \
            apt install -y build-essential locales && \
            apt install -y sudo vim zsh unzip htop nvtop btop wget xrdp tmux git curl xrdp && \
            apt install -y fail2ban && \
            apt install -y openssh-server && \
            env > /etc/environment

# create a dir for ssh daemon
RUN mkdir -p /var/run/sshd

# Set environment variables.
ENV HOME=/root

# Define working directory.
WORKDIR /root

# https://devtron.ai/blog/cmd-and-entrypoint-differences/
# ENTRYPOINT sets default parameters that cannot be overriden while starting up docker containers with CLI params
# (appended as a CLI params)
ENTRYPOINT ["sh", "-c", "service ssh start && service fail2ban start && exec zsh"]


# CMD command is used to give the default commands when the image is instantiated (only once).
# It doesn’t execute while build stage. There should be only one CMD per Dockerfile,
# you can list multiple but the last one will be executed.
# CMD sets the default parameters that can be overriden from the docker CLI when running a docker container
# CMD ["zsh"]
