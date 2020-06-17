
# ---------------
# Use cases
# ---------------
# Being able to download and upload code at customer
# repo init
# repo sync
# repo start
# repo ...

# It should manipulate the files on your local machine

# Alias to make it nicer
# alias cde-repo='docker run --rm -it -v `pwd`:/workdir cde-repo'

# ---------------
# Install process (on a "normal" machine)
# ---------------
# Make sure that you have a bin/ directory in your home directory and that it’s included in your path:
# mkdir ~/bin
# PATH=~/bin:$PATH
# Download the Repo Launcher and ensure that it’s executable:
# curl https://storage.googleapis.com/git-repo-downloads/repo > ~/bin/repo
# chmod a+x ~/bin/repo

# ---------------
# Requirements
# ---------------
# Python 3+
# Git

# ---------------
# Run by
# ---------------
# docker build --tag cde-repo:latest .

# ---------------
# Test by 
# ---------------
# repo init -u http://35.228.249.85/jegere
# repo sync

# ---------------
# Progress?
# ---------------

# Managed to run something, but python is still a problem!
# 

# ---------------

FROM ubuntu:18.04 as cde-repo
#RUN export PATH=/mnt/bin:$PATH
RUN apt-get update \
    && apt-get -y install curl
RUN apt-get -y install python3
RUN apt-get -y install python3-pip
RUN mkdir /mnt/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /mnt/bin/repo
RUN chmod a+x /mnt/bin/repo

# This didn't work
#RUN python3 -m pip install --user --upgrade pip
#RUN python3 -m pip install --user virtualenv
#RUN python3 -m venv env
#RUN source env/bin/activate

# This didn't work
#RUN alias python=python3

RUN mkdir /workdir
WORKDIR /workdir

ENTRYPOINT [ "/mnt/bin/repo" ]
 