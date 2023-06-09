# HDInsight Spark cluster

module "hdinsight_spark" {
  source = "github.com/Azure/azure-data-labs-modules/terraform/hdinsight/hdinsight-spark"

  basename            = "spark${local.basename}"
  resource_group_name = local.resource_group_name
  location            = local.location
  cluster_version     = "5.0"
  tier                = "Standard"

  subnet_id          = null
  virtual_network_id = null

  component_version_spark = "3.1"

  gateway_username = var.gateway_username
  gateway_password = var.gateway_password

  ssh_username = var.ssh_username
  ssh_password = var.ssh_password

  roles_head_node_vm_size                 = var.roles_head_node_vm_size
  roles_worker_node_vm_size               = var.roles_worker_node_vm_size
  roles_worker_node_target_instance_count = var.roles_worker_node_target_instance_count
  roles_zookeeper_node_vm_size            = var.roles_zookeeper_node_vm_size

  storage_resource_id           = module.storage_account.id
  filesystem_id                 = module.storage_account.adls_id
  managed_identity_resource_id  = module.user_assigned_identity.id
  managed_identity_principal_id = module.user_assigned_identity.principal_id

  ambari_server_name                           = module.sql_server.name
  ambari_database_name                         = module.sql_db["ambari"].name
  ambari_database_administrator_login          = var.administrator_login
  ambari_database_administrator_login_password = var.administrator_login_password

  hive_server_name                           = module.sql_server.name
  hive_database_name                         = module.sql_db["hive"].name
  hive_database_administrator_login          = var.administrator_login
  hive_database_administrator_login_password = var.administrator_login_password

  oozie_server_name                           = module.sql_server.name
  oozie_database_name                         = module.sql_db["oozie"].name
  oozie_database_administrator_login          = var.administrator_login
  oozie_database_administrator_login_password = var.administrator_login_password

  tags = local.tags
}