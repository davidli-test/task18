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

## Github
  User: davidli-test
  Project: https://github.com/davidli-test/task18.git
## Environment
  Requirement:
  
  * docker
  
  * awscli
  
  * terraform
  
## Build
  Build containers:
  
    docker build -t task18app -f Dockerfile.app .
    
    docker build -t task18web -f Dockerfile.web .

## Publish
  ECR registry name: task18-registry
  ECR registry URI: 526502002860.dkr.ecr.eu-west-1.amazonaws.com/task18-registry
  Publish images to ECR

## Run
    docker run -d -p 8080:8080 task18app

## AWS
  Setup free account: davidli.test@aol.com
  AWS access ID: AKIAJHW5IUA4FTXRYKNQ
  Default zone: eu-west-1

## Terraform
  Image: amontaigu/terraform
  
  Mount working dir into container and init terraform: docker run --rm -v $HOME/task18:/data amontaigu/terraform init
  To apply TF state: docker run --rm -v $HOME/task18:/data amontaigu/terraform apply -input=false -auto-approve
  Note: "auto-approve" is required to run without interractive prompts