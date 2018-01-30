#	Start instance

provider "aws" {
  region = "${var.aws_region}"
}

resource "aws_instance" "web" {
  ami = "${lookup(var.amis, var.aws_region)}"
  instance_type = "t2.micro"
  subnet_id = "${aws_subnet.web_subnet.id}"
  vpc_security_group_ids = ["${aws_security_group.sgweb.id}"]
  key_name = "${var.key_name}"

#	Install python

  provisioner "remote-exec" {
    inline = [
      "sudo apt update",
      "sudo apt -y upgrade",
      "sudo apt -y install python2.7",
    ]
    connection {
      private_key = "${file(var.private_key_path)}"
      user = "ubuntu"
    }
  }
}
