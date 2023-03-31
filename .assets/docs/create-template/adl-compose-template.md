# Create New Template • Compose

Each template uses [Azure Data Labs modules repository](https://github.com/Azure/azure-data-labs-modules) within the `/infra/terraform` folder, including different files:

**Core files**

-  [main.tf](https://github.com/Azure/azure-data-labs/blob/main/temp-lab-ade-demo/infra/terraform/main.tf): includes azurerm provider configuration, including versioning.
-  [variables.tf ](https://github.com/Azure/azure-data-labs/blob/main/temp-lab-ade-demo/infra/terraform/variables.tf): defines all variables to for a template, adding default values if needed.
-  [terraform.tfvars.example](https://github.com/Azure/azure-data-labs/blob/main/temp-lab-ade-demo/infra/terraform/terraform.tfvars.example): TBD
-  [locals.tf](https://github.com/Azure/azure-data-labs/blob/main/temp-lab-ade-demo/infra/terraform/locals.tf): includes tags, private DNS zones definition, and config-lab.yml configuration.

**Resources files**

You can decide to keep multiple modules in single resource file, or have one terraform file per module. For instance, [resource_group.tf](https://github.com/Azure/azure-data-labs/blob/main/temp-lab-ade-demo/infra/terraform/resource_group.tf), [network.tf](https://github.com/Azure/azure-data-labs/blob/main/temp-lab-ade-demo/infra/terraform/network.tf), and [key_vault.tf](https://github.com/Azure/azure-data-labs/blob/main/temp-lab-ade-demo/infra/terraform/key_vault.tf) show how you can reference the Azure Data Labs modules.

1. Decide which modules you need.
2. Understand modules variables. If there is an existing azurerm variable/property not supported by a Azure Data Lab Module, feel free to open a [Pull Request](https://github.com/Azure/azure-data-labs-modules/pulls).
3. Compose required Terraform files invoking required modules.

**Local testing using Terraform**

Once you compose your template, you can test it locally before creating a GitHub Actions as follows:

- Run `terraform fmt -recursive` on the  `/infra/terraform` folder
- Run `terraform init` & `terraform apply -auto-approve` on the same folder
- Jump to [Azure](https://portal.azure.com) to validate that everything is okay
- Clean up your environment by `terraform destroy -auto-approve`
- git commit and push the branch to the GitHub repo


At this stage, your new template is already available on GitHub.

>[< Previous](./adl-folder-structure.md) &nbsp;&nbsp; | &nbsp;&nbsp; 
>[Next >](./adl-template-deployment.md)
