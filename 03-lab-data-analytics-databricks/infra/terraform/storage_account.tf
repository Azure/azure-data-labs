# Storage Account

module "storage_account_adb" {
  source = "git::https://github.com/Azure/azure-data-labs-modules.git//terraform/storage-account?ref=v1.5.0&depth=1"

  basename            = "${local.safe_basename}adb"
  resource_group_name = module.resource_group.name
  location            = module.resource_group.location
  account_tier        = "Standard"

  subnet_id                 = var.enable_private_endpoints ? module.subnet_default[0].id : null
  private_dns_zone_ids_blob = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.blob.core.windows.net"].id] : []
  private_dns_zone_ids_dfs  = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.dfs.core.windows.net"].id] : []
  private_dns_zone_ids_file = var.enable_private_endpoints ? [module.private_dns_zones[0].list["privatelink.file.core.windows.net"].id] : []

  hns_enabled             = true
  firewall_default_action = "Deny"
  firewall_ip_rules       = [data.http.ip.body]
  firewall_bypass         = ["AzureServices"]

  module_enabled                = true
  is_private_endpoint           = var.enable_private_endpoints
  public_network_access_enabled = var.public_network_enabled

  tags = local.tags
}