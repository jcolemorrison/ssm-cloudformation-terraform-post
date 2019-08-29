provider "aws" {
  region = "us-east-1"
}

data "aws_ssm_parameter" "instance_name" {
  name = "secure-instance-name"
  with_decryption = true
}


resource "aws_instance" "example_instance" {
  ami = "ami-0b898040803850657"
  instance_type = "t2.micro"
  tags = {
    Name = data.aws_ssm_parameter.instance_name.value
  }
}
