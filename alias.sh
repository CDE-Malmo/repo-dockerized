alias cde-repo='docker run --rm -it -v `pwd`:/workdir -v ${HOME}/.ssh:/root/.ssh -v ${HOME}/.gitconfig:/root/.gitconfig cdemalmo/cde-repo:latest'
