### Base image tasks
FROM ubuntu:16.04

RUN apt update -y

RUN apt-get install -y software-properties-common \
    git-core \
    python-software-properties
RUN add-apt-repository -y ppa:git-core/ppa
RUN add-apt-repository -y ppa:greymd/tmux-xpanes
RUN apt-add-repository -y ppa:ansible/ansible
RUN apt update -y

RUN apt-get update -y && apt-get install -y \
	python \
	python-pip \
	ansible \
	openssh-client \
	vim \
  wget

RUN apt install -y tmux-xpanes

### Copy private key to docker container if needed 
#COPY .ssh/ /home/myuser/.ssh
#RUN groupadd myuser
#RUN useradd -g root -g myuser -ms /bin/bash myuser
#RUN chmod -R 700 /home/myuser/.ssh && chown -R myuser /home/myuser/.ssh && chown -R myuser:myuser /home/myuser
