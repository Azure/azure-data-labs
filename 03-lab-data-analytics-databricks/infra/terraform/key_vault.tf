# Key Vault
/*
module "key_vault" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/key-vault?ref=v1.5.0&depth=1"

  basename                 = local.basename
  resource_group_name      = local.resource_group_name
  location                 = local.location
  sku_name                 = "premium"
  purge_protection_enabled = false

  subnet_id            = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.vaultcore.azure.net"].id] : null

  firewall_default_action = "Deny"
  firewall_bypass         = "AzureServices"

  is_private_endpoint = var.enable_private_endpoints

  tags = local.tags
}
*/