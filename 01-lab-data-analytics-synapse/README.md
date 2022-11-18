# Azure Data labs • data-analytics-syn

This template repository (aka blueprint) contains all templates to deploy a **secure Azure Synapse Analytics environment**. This blueprint offers some optional modules which can be enabled/disabled to support some of architectures below.

[TODO > Add architecture diagram]

### What will be deployed?

By navigating through the deployment steps, you will deploy the following resources in an Azure subscription:

- [Storage Account](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/storage-account) with Private Endpoints for `blob` and `file`, including Data Lake Storage Gen2
- [Key Vault](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/key-vault) with Private Endpoint
- [Virtual Network](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/virtual-network), including three subnets `default` and `AzureBastionSubnet` 
- [Jumphost](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/virtual-machine) (Windows) with [Bastion](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/bastion-host) for easy access to the VNet
- [Synapse Workspace](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-workspace) with Private Endpoints for dedicated SQL pool, serverless SQL pool and development endpoint
- [Synapse Private Link Hub](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-private-link-hub) with Private Endpoint
- (optional) [Synapse Spark pool](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-spark-pool)
- (optional) [Synapse SQL pool](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-sql-pool)
- (optional) [Data Factory](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/data-factory)
- (optional) [Analysis Services Server](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/analysis-services-server)

### Deployment

- Supported regions: TBC
- Enabling / disabling resources: TBC
- Extending the template: TBC

> For more information see [FAQ & Known Issues](../assets/docs/adl-knownissues.md)
