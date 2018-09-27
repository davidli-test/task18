resource "aws_key_pair" "task18" {
  key_name = "task18"
  public_key = "${file("task18.pub")}"
}