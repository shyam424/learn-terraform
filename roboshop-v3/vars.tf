//looping the modules

provider "aws" {
  region = "us-east-1"
}


variable "security_group" {
  default = [ "sg-0978f52aab0141c35" ]
}

variable "zone_id" {
  default = "Z02176822VOQOIVSLJU7D"
}

variable "components" {
  default = {
    frontend = {
      name = "frontend"
      instance_type = "t3.micro"
    }
    carts = {
      name = "carts"
      instance_type = "t3.micro"
    }
    catalogue = {
      name = "catalogue"
      instance_type = "t3.micro"
    }
    user = {
      name = "user"
      instance_type = "t3.micro"
    }
   shipping = {
      name = "shipping"
      instance_type = "t3.micro"
    }
    payment = {
      name = "payment"
      instance_type = "t3.micro"
    }
    mongodb = {
      name = "mongodb"
      instance_type = "t3.micro"
    }
    redis = {
      name = "redis"
      instance_type = "t3.micro"
    }
    mysql = {
      name = "mysql"
      instance_type = "t3.micro"
    }
    rabbitmq = {
      name = "rabbitmq"
      instance_type = "t3.micro"
    }
  }
}