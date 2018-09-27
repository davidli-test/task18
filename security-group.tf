resource "aws_security_group" "default" {
  name = "task18-default-sg"
  description = "Allow all traffic in the VPC"
  vpc_id = "${aws_vpc.default.id}"
  ingress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }
  egress {
    from_port   = "0"
    to_port     = "0"
    protocol    = "-1"
    self        = true
  }
  tags { 
    Name = "task18-default-vpc-sg" 
  }
}

resource "aws_security_group" "web" {
  name = "task18-web-sg"
  description = "Allow HTTP from internet"
  vpc_id = "${aws_vpc.default.id}"

  ingress {
    from_port = 80
    to_port   = 80
    protocol  = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port = 22
    to_port   = 22
    protocol  = "tcp"
    cidr_blocks = ["91.65.62.242/32"]
  }
  tags { 
    Name = "task18-web-vpc-sge" 
  }
}