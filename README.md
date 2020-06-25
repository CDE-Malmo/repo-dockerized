# repo-dockerized
Docker setup for repo tool

# Using it from docker.hub

```
alias cde-repo='docker run --rm -it -v `pwd`:/workdir -v ${HOME}/.ssh:/root/.ssh -v ${HOME}/.gitconfig:/root/.gitconfig cdemalmo/cde-repo:latest'

cde-repo --version
```

# What do we want to do?

Few of us had trouble with making Repo tool work on our machines, so we come up with the idea to dockerize it.
A simple container that would download/or update the code accessible from the host machine.

# Use cases

Being able to download and upload code at customer
```
repo init
repo sync
repo start
repo ...
```

- It should manipulate the files on your local machine

# The things
## Alias to make it nicer

```
alias cde-repo='docker run --rm -it -v `pwd`:/workdir -v ${HOME}/.ssh:/root/.ssh -v ${HOME}/.gitconfig:/root/.gitconfig cde-repo'
```

## Run by

```
docker build --tag cde-repo:latest .
```

## Test by 

```
source alias.sh
cde-repo init -u http://35.228.249.85/jegere
cde-repo sync
```

*Note: you need access to the Gerrit server to be able to do this.*

# To make it better

- Base this on a smaller Linux distro
- Push to docker.hub
