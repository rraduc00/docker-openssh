# docker-openssh
Docker container (Ubuntu based) with openssh and fail2ban. My first encounter ever with docker. 

## Useful commands:
- **List images**: `docker image ls`
- **List containers**: `docker container ls --all`
- **Build a Docker Image**:` docker build -t nameYouWant .` // -t is used to give a tag name to the imagen. "." indicates the path to your Dockerfile
- **Run the application**: `docker run -p 8080:22 nameYouWant` // -p is used to map the local port, in this case 8080, to the container's port, in this case 22.
- **Run the application in background (dedtached mode)**: `docker run -d -p 8080:22 nameYouWant`
- **Stop an application (container)**: `docker container stop containerID`
- **Remove a built app (container)**: `docker container rm containerID`
- **Delete an image**: `docker image rm nameYouWant`

* Replace *nameYouWant* with your actual image name. 

## Official docs.docker.com cheathseet

### List Docker CLI commands
docker
docker container --help

### Display Docker version and info
docker --version
docker version
docker info

### Execute Docker image
docker run hello-world

### List Docker images
docker image ls

### List Docker containers (running, all, all in quiet mode)
docker container ls
docker container ls --all
docker container ls -aq
