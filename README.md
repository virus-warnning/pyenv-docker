# pyenv-docker

Alpine build.

```
docker build -f Dockerfile.alpine -t pyenv-alpine:3.12
docker run --name pyenv1 -it pyenv-alpine:3.12
docker start -i pyenv1
docker rm pyenv1
docker rmi pyenv-alpine:3.12
```

Ubuntu build.

```
docker build -f Dockerfile.ubuntu -t pyenv-alpine:20.04
docker run --name pyenv2 -it pyenv-ubuntu:20.04
docker start -i pyenv2
docker rm pyenv2
docker rmi pyenv-ubuntu:20.04
```
