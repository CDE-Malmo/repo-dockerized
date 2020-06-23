FROM ubuntu:18.04 as cde-repo
RUN apt-get update \
    && apt-get -y install curl
RUN apt-get -y install python3
RUN apt-get -y install git
RUN mkdir /mnt/bin
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /mnt/bin/repo
RUN chmod a+x /mnt/bin/repo

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN mkdir /workdir
RUN mkdir ~/.ssh
WORKDIR /workdir

ENTRYPOINT [ "/mnt/bin/repo" ]
