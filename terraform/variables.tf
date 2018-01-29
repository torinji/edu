variable "aws_access_key" {
  default = "AKIAI2VVUIGY327IY2FQ"
}

variable "aws_secret_key" {
  default = "1MDYYNnj81sF2iIaXkrnXyZerYQlE50HLbJnR+ba"
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
  default = "/home/azher/edu/.ssh/aws_key.pub"
}

variable "private_key_path" {
  default = "/home/azher/edu/.ssh/aws_key"
}


variable "key_name" {
  default = "aws_key"
}
