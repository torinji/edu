# Create a VPC to launch our instances into
resource "aws_vpc" "task1_vpc" {
  cidr_block = "172.31.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "task1_gw" {
  vpc_id = "${aws_vpc.task1_vpc.id}"
}

resource "aws_route" "internet_access" {
  route_table_id         = "${aws_vpc.task1_vpc.main_route_table_id}"
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = "${aws_internet_gateway.task1_gw.id}"
}

resource "aws_subnet" "task1_subnet" {
  vpc_id                  = "${aws_vpc.task1_vpc.id}"
  cidr_block              = "172.31.8.0/24"
  map_public_ip_on_launch = true
}

resource "aws_security_group" "sg1" {
  name        = "terraform_sg"
  vpc_id      = "${aws_vpc.task1_vpc.id}"

  # SSH access from need IP
  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["${vars.access_ip}"]
  }

  # HTTP access from anywhere
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  # outbound internet access
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
