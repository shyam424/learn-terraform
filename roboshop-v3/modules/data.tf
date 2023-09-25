data "aws_ami" "awi" {
  most_recent = true
  name_regex = "Centos-8-DevOps-Practice"
  owners = "997483553536"
}