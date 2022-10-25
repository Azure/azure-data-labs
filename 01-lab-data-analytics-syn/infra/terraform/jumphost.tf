# Bastion

module "bastion" {
  source = "github.com/microsoft/azure-labs-modules/terraform/bastion-host"

  basename  = local.basename
  rg_name   = module.resource_group.name
  location  = module.resource_group.location
  subnet_id = module.subnet_bastion.id

  module_enabled = true

  tags = local.tags
}

# Virtual machine

module "virtual_machine_jumphost" {
  source = "github.com/microsoft/azure-labs-modules/terraform/virtual-machine"

  basename          = local.basename
  rg_name           = module.resource_group.name
  location          = module.resource_group.location
  subnet_id         = module.subnet_default.id
  jumphost_username = var.jumphost_username
  jumphost_password = var.jumphost_password

  module_enabled = true

  tags = local.tags
}