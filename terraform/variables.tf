variable "aws_access_key" {
  default = "aws access key"
}

variable "aws_secret_key" {
  default = "here aws secret key"
}

variable "aws_region" {
  description = "EC2 Region for the VPC"
  default = "us-east-2"
}

variable "amis" {
  description = "AMIs by region"
  default = {
    us-east-2 = "ami-2581aa40"
  }
}

variable "public_key_path" {
  default = "here/path/to/ssh public key"
}

variable "private_key_path" {
  default = "here/path/to/ssh private key"
}


variable "key_name" {
  default = "aws_key"
}

variable "access_ip" {
  default = "here IP for access to aws-instance"
