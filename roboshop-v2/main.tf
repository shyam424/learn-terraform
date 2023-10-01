provider "aws" {
  region = "us-east-1"
}

variable "ami" {
  default = "ami-03265a0778a880afb"
}

variable "instance" {
  default = "t3.small"
}

variable "security_group" {
  default = [ "sg-0978f52aab0141c35" ]
}

variable "zone_id" {
  default = "Z02176822VOQOIVSLJU7D"
}

variable "components" {
  default = {
    frontend = { name = "frontend" }
    catalogue = {name = "catalogue" }
    user = { name = "user" }
    cart = { name = "cart" }
    shipping = { name = "shipping" }
    payment = { name = "payment" }
    mysql = { name = "mysql" }
    mongodb = { name = "mongodb" }
    redis = { name = "redis" }
    rabbitmq = { name = "rabbitmq" }
  }
}

resource "aws_instance" "instances" {
  for_each = var.components
  ami           = var.ami
  instance_type = var.instance
  vpc_security_group_ids = var.security_group

  tags = {
  //  Name = var.components[each.key].name
    Name = lookup(each.value,"name", null)
  }
}

#instances creating in the above will generate as a map

resource "aws_route53_record" "frontend" {
  for_each = var.components
  zone_id = var.zone_id
  name    = "${lookup(each.value,"name",null)}.devopspractice23.online"
  type    = "A"
  ttl     = 30
  records =[ lookup (lookup(aws_instance.instances,each.key,null),"private_ip", null)]
  #data will be coming in the map from the above aws_instance.instances component and you use lookup for that map
}


output "instance_details" {
  value = aws_instance.instances
}

#output will provide how the machines are created with full details