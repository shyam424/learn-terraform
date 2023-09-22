variable "fruits" {
  default = [ "apple", "banana"]
}

output "test_functions" {
  # value = var.fruits[2]  this one will throw error because we have only two values in the list and list start from 0 which is 0,1 and there is no 2
value = element(var.fruits,2)
  # element function will make sure that it wont throw the error which CYCLES the vaules
  #TRY function will return 0 if the value is not there
}
