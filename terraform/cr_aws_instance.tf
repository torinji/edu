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

#	Check ssh connection

  provisioner "remote-exec" {
    inline = [
      "echo instance ready for Ansible"
    ]
    connection {
      private_key = "${file(var.private_key_path)}"
      user = "${var.user}"
    }
  }
}
