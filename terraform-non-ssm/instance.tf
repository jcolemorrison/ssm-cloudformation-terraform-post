provider "aws" {
  region = "us-east-1"
}

variable "instance_name" {
  type = string
  description = "Name of the EC2 instance"
  default = "jerrys-tf-instance"
}

resource "aws_instance" "example_instance" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags = {
    Name = var.instance_name
  }
}
