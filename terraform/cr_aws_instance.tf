resource "aws_key_pair" "awskey" {
  key_name   = "${var.key_name}"
  public_key = "${file(var.public_key_path)}"
}

/* 
Start instance
*/

provider "aws" {
  access_key = "${var.aws_access_key}"
  secret_key = "${var.aws_secret_key}"
  region = "${var.aws_region}"
}

resource "aws_instance" "task1" {
  ami = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.task1_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.sg1.id}"]
  key_name = "${var.key_name}"
  provisioner "remote-exec" {
    inline = ["echo Successfully connected"]
    connection {
      private_key = "${file(var.private_key_path)}"
      user = "ubuntu"
    }
  }

}
