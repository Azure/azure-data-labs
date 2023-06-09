# UAMI

module "user_assigned_identity" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/user-assigned-identity"

  basename            = local.safe_basename
  resource_group_name = local.resource_group_name
  location            = local.location

  tags = local.tags
}