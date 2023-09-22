variable "fruit_name" {
  default = "apple"
}

output "fruits" {
  value = var.fruit_name
}