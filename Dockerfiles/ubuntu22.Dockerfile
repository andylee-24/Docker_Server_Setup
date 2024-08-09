FROM ubuntu:jammy


ENV DEBIAN_FRONTEND=noninteractive
RUN apt -y update && apt -y upgrade && \
    apt install -y unzip tmux openssh-server vim zsh

RUN echo "PermitRootLogin yes" >> /etc/ssh/sshd_config

# without this, sshd does not work
RUN mkdir -p /var/run/sshd

ENV HOME=/root
WORKDIR /root

ENTRYPOINT ["sh", "-c", "service ssh start && exec zsh"]
