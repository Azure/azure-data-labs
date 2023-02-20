# Key Vault

module "key_vault" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/key-vault"

  basename                 = local.basename
  rg_name                  = module.resource_group.name
  location                 = module.resource_group.location
  sku_name                 = "premium"
  purge_protection_enabled = false

  subnet_id            = module.subnet_default.id
  private_dns_zone_ids = [module.private_dns_zones.list["privatelink.vaultcore.azure.net"].id]

  is_sec_module = var.enable_private_endpoints

  tags = local.tags
}