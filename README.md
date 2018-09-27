# Task 18
Enable the company to deploy their applications easily to a fully load balanced public cloud (e.g. AWS) from scratch.
Use infrastructure as code to deploy (e.g. Ansible, Terraform)
A docker container running the provided webservice
o Only use official images from docker hub
o Based on alpine-linux
o Oracle Java 8.x (not OpenJDK)
o To run the webservice execute: java -jar helloworld.war
o Expose service on port 8080)
A webserver (e.g. apache, nginx) which proxies http/s to the application container.
App: http://78.137.98.23/task18/helloworld.war

## Build
  Build containers:
    docker build -t task18app -f Dockerfile.app .
    docker build -t task18web -f Dockerfile.web .


## Run
    docker run -d -p 8080:8080 task18app
