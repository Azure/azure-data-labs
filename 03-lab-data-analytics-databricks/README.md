# Azure Data labs • data-analytics-adb

This template repository contains all templates to deploy a **secure Azure Databricks environment**. This template offers some optional modules which can be enabled/disabled to support different architectures and solutions.

This diagram contains the location of the resources within the different allocated resource groups.
The dotted boxes indicate the resources that are deployed optionally if the correspondant module is enables through `enable_{optional-module}` flag (e.g. `enable_data_factory` variable enables the deployment of the Azure Data Factory resource)

![Alt: Resource Diagram](./assets/img/Data%20Analytics%20with%20Databricks%20-%20Resources%20-%20Solid.png "Resource Diagram")

## What will be deployed?

By navigating through the deployment steps, you will deploy the following resources in an Azure subscription:

| Module | Default? | Comment |
|--------|----------|---------|
| [Resource Group](./infra/terraform/resource_group.tf) | Yes | One for deployed resources and additional one for Private DNS Zones |
| [Log Analytics Workspace](./infra/terraform/log_analytics_workspace.tf) | Yes | Log Analytics Worspace for collecting metrics and logs |
| [Key Vault](./infra/terraform/key_vault.tf) | Yes | Key Vault with Private Endpoint (PE) if `enable_private_endpoints` and firewall bypass for Azure Services |
| [Storage Account](./infra/terraform/storage_account.tf) | Yes | ADLS Gen 2, with Private Endpoints (PEs) for `dfs`, `blob` and `file` if `enable_private_endpoints` |
| [Virtual Network](./infra/terraform/network.tf) | Yes | 10.0.0.0/16 by default |
| [Subnet](./infra/terraform/network.tf) | Yes | Includes two mandatory subnets: `adb-public` and `adb-private` and to optional subnets: `default` and `AzureBastionSubnet` if `enable_private_endpoints` |
| [Databricks Workspace](./infra/terraform/databricks/databricks.tf) | Yes | Includes Back-end & Front-end and Web-authentication Private Links if `enable_private_endpoints` |
| [Jumphost (Windows)](./infra/terraform/jumphost.tf) | No | Enable by `enable_jumphost` for easy access to the VNet |
| [Bastion](./infra/terraform/jumphost.tf) | No | Enable by `enable_jumphost` for easy access to the VNet by the jumphost |
| [Private DNS Zone](./infra/terraform/private_dns_zone.tf) | No | Enable by `enable_private_endpoints` for PE resolution |
| [Data Factory](./infra/terraform/data_factory.tf) | No | Enable by `enable_data_factory`. Includes df and portal PEs, and managed VNet if `enable_private_endpoints` |
| [CosmosDB Account](./infra/terraform/cosmosdb/cosmosdb.tf) | No | Enable by `enable_cosmosdb` |
| [CosmosDB Sql Database](./infra/terraform/cosmosdb/cosmosdb.tf) | No | Enable by `enable_cosmosdb`. Includes PE if `enable_private_endpoints` |
| [Event Hub Namespace](./infra/terraform/event-hubs/event_hubs.tf) | No | Enable by `enable_event_hub_namespace`. Includes PE if `enable_private_endpoints` |
| [Event Hub](./infra/terraform/event_hubs.tf) | No | Enable by `enable_event_hub_namespace` |

## Secure deployment

This diagram contains the network flow of communications between agents and services when private endpoints are enabled (through the `enable_private_endpoints` flag).

Take into account that although the Data Factory Managed Virtual Network is deployed when private endpoints are enabled, the creation of the private endpoint for Databricks showed in the diagram (and any other that may be needed for your use case) are not created by default and should be provisioned. You can check the list of [supported data sources and services](https://learn.microsoft.com/en-us/azure/data-factory/managed-virtual-network-private-endpoint#supported-data-sources-and-services) and see the details of each of them.

![Alt: Private Endpoint Networking Diagram](./assets/img/Data%20Analytics%20with%20Databricks%20-%20Networking%20-%20Solid.png " Private Endpoint Networking Diagram")

### Notes

- Enabling / disabling secure deployment: to enable/disable secure deployment, change `enable_private_endpoints` in config-lab.yml
- Enabling / disabling resources: to enable/disable optional modules, change `enable_{optional-module}` in config-lab.yml
- _Deploying the template:_ to deploy this template, see [Deploy a Lab](../README.md#Deploy-a-Lab).
- _Extending the template:_ to change this template, see [Create a New Template](../README.md#Create-a-New-Template).

> For more information see [FAQ & Known Issues](../assets/docs/adl-knownissues.md)

## Related Architectures

This template supports the following architectures:

- 📘 [Batch scoring of Spark models on Azure Databricks](https://learn.microsoft.com/en-us/azure/assets/img/reference-architectures/ai/batch-scoring-databricks)
- 📘 [Ingestion, ETL, and stream processing pipelines with Azure Databricks](https://learn.microsoft.com/en-us/azure/assets/img/solution-ideas/articles/ingest-etl-stream-with-adb)
- 📘 [Stream processing with Azure Databricks](https://learn.microsoft.com/en-us/azure/assets/img/reference-architectures/data/stream-processing-databricks)
- 📘 [Build a delta lake to support ad hoc queries in online leisure and travel booking](https://learn.microsoft.com/en-us/azure/assets/img/solution-ideas/articles/build-data-lake-support-adhoc-queries-online)
- 📘 [DataOps for the modern data warehouse](https://learn.microsoft.com/en-us/azure/assets/img/example-scenario/data-warehouse/dataops-mdw)
- 📘 [Orchestrate MLOps by using Azure Databricks](https://learn.microsoft.com/en-us/azure/assets/img/reference-architectures/ai/orchestrate-mlops-azure-databricks)
- 📘 [Master data management with Profisee and Azure Data Factory](https://learn.microsoft.com/en-us/azure/assets/img/reference-architectures/data/profisee-master-data-management-data-factory)
- 📘 [Observability patterns and metrics for performance tuning](https://learn.microsoft.com/en-us/azure/assets/img/databricks-monitoring/databricks-observability)

## Additional resources

### Databricks Private Endpoint network connectivity

This diagram contains the network flow of communication between Databricks Control Plane, Databricks Data Plane and users when private endpoints are enabled (through the `enable_private_endpoints` flag).

![Alt: Databricks Private Endpoint Networking Diagram](./assets/img/Data%20Analytics%20with%20Databricks%20-%20Databricks%20connectivity%20-%20Solid.png "Databricks PE Networking Diagram")

### References

[Azure Databricks Docs - Enable Azure Private Link](https://learn.microsoft.com/en-us/azure/databricks/administration-guide/cloud-configurations/azure/private-link)
