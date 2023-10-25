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
##accessing list variable, list index starts from zero
output "fruits_first" {
  value = var.fruits[0]
}

output "fruits_second" {
  value = var.fruits[1]
}


#accessing a map variable

output "accessing_map_var" {
  value = var.fruits_stock["apple"]
}

output "accessing_map_of_map_var" {
  value = var.fruit_stock_with_price["apple"].price
}

#-----------------------------------------------------------------------------
# variable data types

variable "fruit_data_types" {
  default = {
    apple = {
      stock = 100  # number
      type  = "godavari" # string
      for_sale = true # boolean
    }
  }
}

# accessing data types , variable in a combination of any other string then it needs to be in ${}
output "accesing_different_data_types" {
  value = "apple stock = ${var.fruit_data_types["apple"].stock}, apple type = ${var.fruit_data_types["apple"].type},apple sale status = ${var.fruit_data_types["apple"].for_sale}"
}
