provider "aws" {
  region = "us-east-1"
}

data aws_ami_ids "ami" {  #datasource will provide registered ami
  name_regex = "centos"
  owners = ["973714476881"]
}

output "ami" {
  value = data.aws_ami_ids.ami
}