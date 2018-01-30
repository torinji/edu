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
  default = "../ssh/aws_key.pub"
}

variable "private_key_path" {
  default = "../ssh/aws_key"
}


variable "key_name" {
  default = "aws_key"
}

variable "access_ip" {
  default = "194.44.181.195/32"
}
