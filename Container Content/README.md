# Deploy (build) image
`cd Container\ Content`
`sudo docker build -t imageName .`

# Run already deployed openssh server container
`cd Container\ Content`

`sudo docker run -p 8080:22 imageName` // you can replace 8080 with .whatever por you want to map with and imageName with any possible name.

# Connect to openssh server
`ssh test@localhost -p 8080` // 8080 or whatever port you've chosen.

# Execute commands
If you can't execute commands because of `permission denied` you must use `sudo`. (You can only do this if you uncommented the sudo line in Dockerfile)

# Stop openssh server container
`sudo docker container ls -all` //In order to get containerID.

`sudo docker stop containerID`

