# Key Vault

module "key_vault" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/key-vault"

  basename                 = local.basename
  rg_name                  = module.resource_group.name
  location                 = module.resource_group.location
  sku_name                 = "premium"
  purge_protection_enabled = false

  subnet_id            = module.subnet_default[0].id
  private_dns_zone_ids = [module.private_dns_zones.list["privatelink.vaultcore.azure.net"][0].id]

  firewall_default_action = "Deny"
  firewall_bypass         = "AzureServices"

  is_sec_module = var.is_sec_enabled

  tags = local.tags
}