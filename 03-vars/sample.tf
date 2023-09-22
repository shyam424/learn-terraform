# plain variable
variable "fruit_name" {
  default = "apple"
}

output "fruits" {
  value = var.fruit_name
}

# list variable
variable "fruits" {
  default = [
    "apple",
    "banana"
  ]
  #default = [ "apple","banana" ] //single line syntax
}


# map variable, plain value
variable "fruits_stock"  {
  default = {
    apple = 100
    banana = 200
  }
}

# map variable , map of maps

variable "fruit_stock_with_price" {
  default = {
    apple = {
      stock = 100
      price = 3
    }
    banana = {
      stock = 200
      price = 4
    }
  }
}
#--------------------------------------------------------------------------------
##accessing list variable
output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_second" {
  value = var.fruits[1]
}

#-----------------------------------------------------------------------------
#accessing a map variable

output "accessing_map_var" {
  value = var.fruits_stock["apple"]
}