# Bastion

module "bastion" {
  source         = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/bastion-host?ref=v1.4.0"

  basename       = local.basename
  rg_name        = module.resource_group.name
  location       = module.resource_group.location
  subnet_id      = var.enable_jumphost ? module.subnet_bastion[0].id : null

  module_enabled = var.enable_jumphost

  tags           = local.tags
}

# Virtual machine

module "virtual_machine_jumphost" {
  source            = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/virtual-machine?ref=v1.4.0"

  basename          = local.basename
  rg_name           = module.resource_group.name
  location          = module.resource_group.location
  subnet_id         = var.enable_private_endpoints ? module.subnet_default[0].id : null
  jumphost_username = var.jumphost_username
  jumphost_password = var.jumphost_password

  module_enabled    = var.enable_jumphost

  tags              = local.tags
}