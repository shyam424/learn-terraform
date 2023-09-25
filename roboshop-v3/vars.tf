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
    cart = {
      name = "cart"
      instance_type = "t3.micro"
    }
  }
}