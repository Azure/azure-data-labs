# Azure Data Labs - Blueprints

Welcome to Azure Data Labs blueprints solution accelerator repository! This project is intended to serve as starting point for deploying different data, analytics & AI labs in Azure.

> This repo uses [Azure Data Labs modules repository](https://github.com/Azure/azure-data-labs-modules) within the /infra folder of each lab

Each blueprint provides the following features:

- `infra` folder: includes IaC to deploy the required Azure resources of a lab
- `samples` folder:  [TBD] - samples to start with on a lab
- `config-lab.yml` file:  lab config file

## Available Blueprints

| Name | Status |
| - | - |
| [Data Analytics with Azure Synapse](https://github.com/Azure/azure-data-labs-blueprints/tree/main/01-lab-data-analytics-synapse) | [![Blueprint:01-lab-data-analytics-synapse](https://github.com/Azure/azure-data-labs-blueprints/actions/workflows/deploy-01-lab-data-analytics-synapse.yml/badge.svg)](https://github.com/Azure/azure-data-labs-blueprints/actions/workflows/deploy-01-lab-data-analytics-synapse.yml) |
| [Data Science with Azure Machine Learning](https://github.com/Azure/azure-data-labs-blueprints/tree/main/02-lab-data-science-azureml) | [![Blueprint:02-lab-data-science-azureml](https://github.com/Azure/azure-data-labs-blueprints/actions/workflows/deploy-02-lab-data-science-azureml.yml/badge.svg)](https://github.com/Azure/azure-data-labs-blueprints/actions/workflows/deploy-02-lab-data-science-azureml.yml) |
| [Data Analytics with Azure Databricks](https://github.com/Azure/azure-data-labs-blueprints/tree/main/03-lab-data-analytics-databricks) |TBC |
| [Data Analytics with HDInsight (Spark)](https://github.com/Azure/azure-data-labs-blueprints/tree/main/04-lab-data-analytics-hdinsight-spark) |TBC |


## Deploy a Lab

To deploy a lab in your Azure subscription using one of the existing blueprints, please follow the step-by-step instructions:

1. [Prerequisites](./.assets/docs/adl-prerequisited.md)
2. [Create repository](./.assets/docs/adl-createrepository.md)
3. [Setting up Service Principal](./.assets/docs/adl-serviceprincipal.md)
4. [Github Actions Deployment](./.assets/docs/adl-deployment-githubactions.md)
5. [FAQ & Known Isssues](./.assets/docs/adl-knownissues.md)

## Create a New Blueprint

TBC

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit https://cla.opensource.microsoft.com.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.

## Trademarks

This project may contain trademarks or logos for projects, products, or services. Authorized use of Microsoft 
trademarks or logos is subject to and must follow 
[Microsoft's Trademark & Brand Guidelines](https://www.microsoft.com/en-us/legal/intellectualproperty/trademarks/usage/general).
Use of Microsoft trademarks or logos in modified versions of this project must not cause confusion or imply Microsoft sponsorship.
Any use of third-party trademarks or logos are subject to those third-party's policies.
