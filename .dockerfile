# Comments are from https://medium.com/bb-tutorials-and-thoughts/docker-a-beginners-guide-to-dockerfile-with-a-sample-project-6c1ac1f17490

FROM pytorch/pytorch

RUN apt-get update && \
    apt-get install -y build-essential zsh openssh-server && \
    apt-get clean


# CMD command is used to give the default commands when the image is instantiated, 
# it doesn’t execute while build stage. There should be only one CMD per Dockerfile, 
# you can list multiple but the last one will be executed.
CMD ["redis-server", "--protected-mode no"]
