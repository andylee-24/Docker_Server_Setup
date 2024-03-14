# Comments are from https://medium.com/bb-tutorials-and-thoughts/docker-a-beginners-guide-to-dockerfile-with-a-sample-project-6c1ac1f17490

# Pull base image.
FROM pytorch/pytorch:2.0.1-cuda11.7-cudnn8-runtime

# RUN executes the instructions in a new layer on top of the existing image 
# and commit those layers and the resulted layer will be used for 
# the next instructions in the Dockerfile.

# disable the keyboard-setting in the ubuntu while docker RUN
ENV DEBIAN_FRONTEND=noninteractive

RUN \
	    apt update && \
	    apt -y upgrade && \
	    apt install -y build-essential locales && \
	    apt install -y vim zsh unzip htop wget xrdp tmux git curl xrdp && \
	    apt install -y m4 scons doxygen cmake sudo && \
	    apt install -y zlib1g zlib1g-dev && \
	    apt install -y protobuf-compiler libprotobuf-dev libprotoc-dev && \
	    apt install -y libboost-all-dev libpng-dev libelf-dev libgoogle-perftools-dev && \
	    apt install -y fail2ban && \
	    apt install -y openssh-server && \
	    echo "PermitRootLogin yes" >> /etc/ssh/sshd_config && \
     	    export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/opt/conda/lib && \
     	    cp /lib/x86_64-linux-gnu/libtinfo.so.6 /opt/conda/lib && \
     	    cp /lib/x86_64-linux-gnu/libncursesw.so.6 /opt/conda/lib && \
	    env > /etc/environment && \
	    rm /usr/bin/python3 && \
	    ln -s /opt/conda/bin/python /usr/bin/python3


# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# https://devtron.ai/blog/cmd-and-entrypoint-differences/
# ENTRYPOINT sets default parameters that cannot be overriden while starting up docker containers with CLI params
# (appended as a CLI params)
ENTRYPOINT service ssh start && zsh


# CMD command is used to give the default commands when the image is instantiated (only once).
# It doesn’t execute while build stage. There should be only one CMD per Dockerfile, 
# you can list multiple but the last one will be executed.
# CMD sets the default parameters that can be overriden from the docker CLI when running a docker container
# CMD ["zsh"]
