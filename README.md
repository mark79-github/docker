# DevOps - Containerization, CI/CD &amp; Monitoring - January 2023 - SoftUni
## Basic Containerization with Docker

The whole process is automated

1. Creating Vagrantfile with the following configuration":
      - Box: "shekeriev/centos-stream-9"
      - Host name: "docker.martin.bg"
      - Private network with dedicated IP: "192.168.34.100"
      - Forwarded port - "guest:host": "8080:8080"
      - Provisioning via provided bash script: "docker.sh"
      - The default shared folder settings are used: "/vagrant"
      - Set virtual machine memory size use: 2048MB
      - Set virtual machine name: "docker"
      - Create after triger event to open default browser at address http://localhost:8080/ to see the result
2. Creating index.html file at root folder:
      - Set h1 tag with the following text: "Hello from my first container!"
3. Creating Dockerfile:
      - The base image upon which my image is built: "centos:centos8"
      - Maintainer: "Martin Dimitrov"
      - Change the mirrors to update CentOS: `CentOS Linux 8 had reached the End Of Life (EOL) on December 31st, 2021. It means that CentOS 8 will no longer receive development resources from the official CentOS project. After Dec 31st, 2021, if you need to update your CentOS, you need to change the mirrors to vault.centos.org where they will be archived permanently.`
      - RUN bash commands for: updating yum, installing apache server and clear cache folder
      - Start Apache server in foreground: "/usr/sbin/httpd -D FOREGROUND"
      - ЕXPOSE port: "80"
4. Creating docker bash file script:
      - Add VM to hosts file
      - Add docker repository
      - Update base image and install docker
      - Enable the installed docker and start its deamon
      - Check docker status
      - Adding vagrant user to the docker group for working without sudo command
      - Open firewall port for http and reload the firewall
      - Copy files from shared folder
      - Build image from Dockerfile. It's named: "httpd-docker-image"
      - Run a the container, from above created image in background, forwarding port 8080 on the host to port 80 on the guest
      - List running docker container
