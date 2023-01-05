# data-analytics-synapse template

This template repository contains all templates to deploy a (secure) **Azure Synapse Analytics environment**. This template offers some optional modules which can be enabled/disabled to support some of architectures below.

[TODO > Add architecture diagram]

### What will be deployed?

By navigating through the deployment steps, you will deploy the following resources in an Azure subscription:

| Module | Default? | Comment |
| - | - | - |
| [Storage Account](./infra/terraform/storage_account.tf) | Yes | ADLS Gen2. Includes `blob` and `dfs` private endpoints (PEs) if  `enable_private_endpoints`
| [Key Vault](https://github.com/Azure/azure-data-labs-modules/tree/main/terraform/key-vault) | Yes | Includes `vault` PEs if `enable_private_endpoints`
| [Virtual Network](./infra/terraform/network.tf) | Yes | 10.0.0.0/16 by default
| [Subnet](./infra/terraform/network.tf) | Yes | Includes two subnets `default` (10.0.1.0/24) and `bastion` (10.0.10.0/27)
| [Synapse Workspace](./infra/terraform/synapse.tf) | Yes | Includes `sql` and `dev` PEs + Private Link Hub if `enable_private_endpoints`
| [Synapse Spark Pool](./infra/terraform/synapse.tf) | No | Enable by `enable_synapse_spark_pool`
| [Synapse SQL Pool](./infra/terraform/synapse.tf) | No | Enable by `enable_synapse_sql_pool`
| [Data Factory](./infra/terraform/data_factory.tf) | No | Enable by `enable_data_factory`. Includes `df` and `portal` PEs if `enable_private_endpoints`
| [Data Factory](./infra/terraform/data_factory.tf) | No | Enable by `enable_data_factory`. Includes `df` and `portal` PEs if `enable_private_endpoints`
| [Analysis Services Server](./infra/terraform/analysis_services_server.tf) | No | Enable by `enable_analysis_services_server`
| [Jumphost (Windows)](./infra/terraform/jumphost.tf) | No | Includes Bastion, enable by `enable_jumphost`

### Secure deployment

[TODO > Add diagram and few bullet points in terms of Network Security]

### Deployment

- **Enabling / disabling secure deployment**: to enable/disable secure deployment, change `enable_private_endpoints` in config-lab.yml.
- **Enabling / disabling resources**: to enable/disable optional modules, change `enable_{optional-module}` flag in config-lab.yml. 
- **Deploying the template**: to deploy this template, see [Deploy a Lab]().
- **Extending the template**: to change this template, see [Create a New Template]().

> For more information see [FAQ & Known Issues](../assets/docs/adl-knownissues.md)

### Related Architectures

### Samples
