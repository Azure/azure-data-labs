# Create New Template • Compose

Each template uses [Azure Data Labs modules repository](https://github.com/Azure/azure-data-labs-modules) within the `/infra/terraform` folder, including different files:

**Core files**

- main.tf: includes azurerm provider configuration, including versioning
- variables.tf: defines all variables to for a template, adding default values if needed
- terraform.tfvars.example: TBD
- locals.tf: includes tags, private DNS zones definition, and config-lab.yml configuration

**Resources files**

You can decide to keep multiple modules in single resource file, or have one terraform file per module. For instance, the resource_group.tf, network.tf, and key_vault.tf show you how to reference the Azure Data Labs modules.

1. Decide which Modules you need
2. Understand Modules variables. If there is an existing azurerm variable/property not supported by a Azure Data Lab Module, feel free to open a Pull Request 
3. Compose required Terraform files invoking required Modules

**Local testing**

Once you compose your template, you can test it locally before creating a GitHub Actions as follows:

- Run terraform fmt -recursive on the the `/infra/terraform` folder
- Run terraform init & terraform apply -auto-approve on the same folder
- Jump to Azure to validate that everything is okay
- Clean up your environment by terraform destroy
- git commit and push the branch to the GitHub repo

At this stage, your new template is already on GitHub available to be deployed.
