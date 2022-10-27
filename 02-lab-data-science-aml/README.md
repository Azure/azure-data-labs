# Azure Data Labs • data-science-aml

This template repository (aka blueprint) contains all templates to deploy a secure Azure Machine Learning environment. This blueprint offers some optional modules which can be enabled/disabled to support some of architectures below.

[TODO > Add architecture diagram]

### What will be deployed?

By navigating through the deployment steps, you will deploy the following resources in an Azure subscription:

- [Storage Account](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/storage-account) with Private Endpoints for `blob` and `file`, including Data Lake Storage Gen2
- [Machine Learning Workspace](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/machine-learning/machine-learning-workspace) with Private Endpoint
- [Machine Learning Compute Cluster](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/machine-learning/machine-learning-compute-cluster)
- (optional) [Machine Learning Synapse Spark](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/machine-learning/machine-learning-synapse-spark)
- [Key Vault](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/key-vault) with Private Endpoint
- [Container Registry](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/container-registry) with Private Endpoint
- [Application Insights](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/application-insights)
- [Virtual Network](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/virtual-network), including three subnets `default`, `compute` and `AzureBastionSubnet` 
- [Jumphost](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/virtual-machine) (Windows) with [Bastion](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/bastion-host) for easy access to the VNet
- (optional) [Synapse Workspace](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-workspace) with Private Endpoints
- (optional) [Synapse Private Link Hub](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-private-link-hub) with Private Endpoint
- (optional) [Synapse Spark pool](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-spark-pool)
- (optional) [Synapse SQL pool](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/synapse/synapse-sql-pool)

### Notes

- Supported regions: TBC
- Enabling / disabling resources: TBC
- Extending the template: TBC

> For more information see [FAQ & Known Issues](../assets/docs/adl-knownissues.md)

### Related Architectures

This blueprint supports the following architectures.

- 📘 [Secure Azure Machiner Learning Service (AzureML) Environment](https://techcommunity.microsoft.com/t5/fasttrack-for-azure/secure-azure-machine-learning-service-azureml-environment/ba-p/3162297)
- 📘 [Azure Machiner Learning Architecture](https://docs.microsoft.com/en-us/azure/architecture/solution-ideas/articles/azure-machine-learning-solution-architecture)
- 📘 [Enterprise Security and Compliance for Azure Machine Learning](https://techcommunity.microsoft.com/t5/ai-machine-learning-blog/enterprise-security-and-compliance-for-azure-machine-learning/ba-p/3484858)
