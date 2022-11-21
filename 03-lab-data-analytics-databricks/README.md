# Azure Data labs • data-analytics-adb

This template repository contains all templates to deploy a **secure Azure Databricks environment**. This template offers some optional modules which can be enabled/disabled to support some of architectures below.

[TODO > Add architecture diagram]

### What will be deployed?

By navigating through the deployment steps, you will deploy the following resources in an Azure subscription:

- [Storage Account](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/storage-account) with Private Endpoints for `blob` and `file`, including Data Lake Storage Gen2
- [Virtual Network](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/virtual-network), including four subnets `default`, `AzureBastionSubnet`, `adb-public` and `adb-private`
- [Jumphost](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/virtual-machine) (Windows) with [Bastion](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/bastion-host) for easy access to the VNet
- [Databricks Workspace](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/databricks/databricks-workspace) with Back-end, Front-end and Web-authentication Private Links.

- (optional) [Data Factory](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/data-factory)

### Deployment

- Supported regions: TBC
- Enabling / disabling resources: TBC
- Extending the template: TBC

> For more information see [FAQ & Known Issues](../assets/docs/adl-knownissues.md)

### Related Architectures

This template supports the following architectures.

