provider "aws" {
  region = "us-east-1"
}

variable "components" {
  default = {
    frontend = {
      name          = "frontend"
      instance_type = "t3.micro"
    }
    cart = {
      name          = "cart"
      instance_type = "t3.micro"
    }
  }

  resource "aws_security_group" "allow_tis" {
    ## count = length(var.components)-->dont use count
    for_each = var.components
    name = lookup(each.value,"name", null)
    #each.Key is used if we want the direct value of catalogue
    #if there is no value then output is null
  }
