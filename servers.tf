resource "aws_instance" "app" {
  count = 1
  ami = "${lookup(var.amis, var.region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.public.id}"
  security_groups = ["${aws_security_group.default.id}"]
  key_name = "${aws_key_pair.task18.key_name}"
  source_dest_check = false
  user_data = "${file("app.yaml")}"
  tags = { 
    Name = "task18-app-${count.index}"
  }
}