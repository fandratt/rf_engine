# Robot Framework

This automation requires you to install Docker. Kindly install based on your OS:
`https://www.docker.com/products/docker-desktop`

## Build Docker Image

Run in your terminal `build.sh` to create the docker image. Make sure you have stable internet connection as it will download the required dependencies.

## Run Robot

### Traditional Way

> Run Specific Robot File

```sh
robot -d Results /path/path/file.robot
```

> Run Robot Specific Tags

```sh
robot -d Results --include tagName /path/path/folder/
```

> Run Specific Test Case from a Test Suite

```sh
robot -d Results -t "test case name here" /path/path/file.robot
```