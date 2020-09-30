# repo-dockerized
Docker setup for repo tool

## Why?
So that anyone can start using Repo on their machine without messing around. 

It happens that people have trouble with making Repo tool work on their machines, so we come up with the idea to dockerize it.
A simple container that would download/or update the code accessible from the host machine. 

This is also an exercise in dockerizing complex commands that require a specific environment. This concept can be used with almost any commandline tool.

# How to use it

*Note: You need to create a personal access token for your Github user to be able to download packages from the Github registry. Use this token to login to the Github Docker registry. Read more [here](https://docs.github.com/articles/configuring-docker-for-use-with-github-package-registry/).*

Create an alias to start the container and run repo tool. The ENTRYPOINT is set to `[ "/mnt/bin/repo" ]`

```
alias cde-repo='docker run --rm -it -v `pwd`:/workdir -v ${HOME}/.ssh:/root/.ssh -v ${HOME}/.gitconfig:/root/.gitconfig docker.pkg.github.com/cde-malmo/repo-dockerized/cde-repo:latest'
```

Use `cde-repo --version` to make sure everything works.

From now on use `cde-repo` (the alias) whenever you want to use repo tool, e.g. to run `repo init` you call `cde-repo init`.

# Possible improvements

- Base this on a smaller Linux distro
