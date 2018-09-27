variable "access_key" { 
  description = "AWS access key"
}

variable "secret_key" { 
  description = "AWS secret key"
}

variable "region"     { 
  description = "AWS region to host your network"
  default     = "eu-west-1" 
}

variable "vpc_cidr" {
  description = "CIDR for VPC"
  default     = "172.31.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR for public subnet"
  default     = "172.31.128.0/24"
}

variable "private_subnet_cidr" {
  description = "CIDR for private subnet"
  default     = "172.32.192.0/24"
}

variable "amis" {
  description = "AMI instances"
  default = {
    eu-west-1 = "ami-047bb4163c506cd98"
  }
}