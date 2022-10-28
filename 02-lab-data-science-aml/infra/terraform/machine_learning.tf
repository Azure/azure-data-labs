# Machine learning workspace

module "machine_learning_workspace" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/machine-learning/machine-learning-workspace"

  basename                = local.basename
  rg_name                 = module.resource_group.name
  location                = module.resource_group.location
  storage_account_id      = module.storage_account_mlw.id
  key_vault_id            = module.key_vault.id
  application_insights_id = module.application_insights.id
  container_registry_id   = module.container_registry.id

  subnet_id = module.subnet_default.id
  private_dns_zone_ids = [
    module.private_dns_zones.list["privatelink.api.azureml.ms"].id,
    module.private_dns_zones.list["privatelink.notebooks.azure.net"].id
  ]

  public_network_access_enabled = false
  image_build_compute_name      = "image-builder"

  is_sec_module = var.enable_sec

  tags = local.tags
}

# Machine learning Synapse Spark

module "machine_learning_synapse_spark" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/machine-learning/machine-learning-synapse-spark"

  basename                      = var.postfix
  location                      = module.resource_group.location
  machine_learning_workspace_id = module.machine_learning_workspace.id
  synapse_spark_pool_id         = module.synapse_spark_pool.id

  module_enabled = var.enable_machine_learning_synapse_spark
}

# Machine learning compute clusters

module "machine_learning_compute_cluster_image-builder" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/machine-learning/machine-learning-compute-cluster"

  name                          = "image-builder"
  location                      = module.resource_group.location
  subnet_id                     = module.subnet_compute.id
  machine_learning_workspace_id = module.machine_learning_workspace.id

  module_enabled = true
}

module "machine_learning_compute_cluster_cpu_cluster" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/machine-learning/machine-learning-compute-cluster"

  name                          = "cpu-cluster"
  location                      = module.resource_group.location
  subnet_id                     = module.subnet_compute.id
  machine_learning_workspace_id = module.machine_learning_workspace.id

  module_enabled = var.enable_machine_learning_compute_cluster
}