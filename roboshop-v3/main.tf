module "components" {



  source            = "./modules"
  zone_id           = var.zone_id
  security_groups   = var.security_group

  for_each = var.components

  name              = each.value ["name"]
  instance_type     = each.value ["instance_type"]

}