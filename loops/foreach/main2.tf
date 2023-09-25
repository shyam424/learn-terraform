variable "components" {
  default = {
    catalogue ={ name= "catalogue_sg"}
    mongodb   ={ name= "mongodb_sg"}
    #catalogue= Key
    #inside the flower brackets is VALUE(name="___")
  }
}

resource "aws_security_group" "allow_tis" {
 ## count = length(var.components)-->dont use count
  for_each = var.components
  name = lookup (var.components, each.value["name"], null)
  #each.Key is used if we want the direct value of catalogue
  #if there is no value then output is null
}