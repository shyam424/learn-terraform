provider "aws" {
  region = "us-east-1"
}

variable "components"{
  default = ["frontend","mongodb"]
}

resource "aws_instance" "rabbitmq" {

  count = length(var.components)
  #//Count= will let you know how many time sit should run in loops
  #Count is a keyword

  ami           = "ami-03265a0778a880afb"
  instance_type = "t3.small"
  vpc_security_group_ids = [ "sg-0978f52aab0141c35" ]

  tags = {
    Name = element(var.components,count.index)
  }
}