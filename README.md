# root_notebook_docker

Aim to build a docker image for root study. This example shows how to craete a Docker file that will act as a ROOT Jupyter web service listening on port 8888.
Idea is come from [root/docker examples](https://github.com/root-project/docker-examples)

## Building
To build the container:
```
$ docker build -t root-notebooks .
```
### Running
To run the container:
```
$ docker run --name root-notebooks -it root-notebooks /bin/bash
```

### Detail
See my git book
