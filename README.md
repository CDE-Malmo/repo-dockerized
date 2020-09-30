# repo-dockerized
Docker setup for repo tool

## Why?
So that anyone can start using Repo on their machine without messing around. 

It happens that people have trouble with making Repo tool work on their machines, so we come up with the idea to dockerize it.
A simple container that would download/or update the code accessible from the host machine. 

This is also an exercise in dockerizing complex commands that require a specific environment. This concept can be used with almost any commandline tool.

# How to use it

## Using it from docker.hub

First create an alias to start the container and run repo tool. The ENTRYPOINT is set to `[ "/mnt/bin/repo" ]`

```
alias cde-repo='docker run --rm -it -v `pwd`:/workdir -v ${HOME}/.ssh:/root/.ssh -v ${HOME}/.gitconfig:/root/.gitconfig cdemalmo/cde-repo:latest'
```

Use `cde-repo --version` to make sure everything works.

From now on use `cde-repo` (the alias) whenever you want to use repo tool, e.g. to run `repo init` you call `cde-repo init`.

# Possible improvements

- Base this on a smaller Linux distro
