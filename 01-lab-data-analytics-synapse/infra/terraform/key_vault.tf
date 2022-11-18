# Key Vault

module "key_vault" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/key-vault"

  basename                 = local.basename
  rg_name                  = module.resource_group.name
  location                 = module.resource_group.location
  sku_name                 = "premium"
  purge_protection_enabled = false

  subnet_id            = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.vaultcore.azure.net"].id] : null

  firewall_default_action = "Deny"
  firewall_bypass         = "AzureServices"

  is_sec_module = var.enable_private_endpoints

  tags = local.tags
}