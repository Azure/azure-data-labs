# Deploy a Lab • Prerequisites

### Prerequisites

Before we start with the deployment of a lab, please make sure that you have the following available:

- An Azure suscription. If you don't have an Azure subscription, [get your free Azure account here](https://azure.microsoft.com/en-us/free/)
- [User access Administrator](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#user-access-administrator) or [Owner](https://docs.microsoft.com/en-us/azure/role-based-access-control/built-in-roles#owner) access to the suscription to be able to create a Service Principal and role assignments for it
- For the deployment, please choose one of the supported Azure regions

### Supported Azure regions

Deployments have been tested in `westus2` and `northeurope`. To see Azure resource availability by region [click here](https://azure.microsoft.com/en-us/global-infrastructure/services/).

### Deployment

Now, you have two options to deploy different templates:

1. GitHub Actions
2. Deploy using Terraform

To use the Terraform option, please make sure you have the [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) and [Terraform](https://www.terraform.io/downloads) installed. Then, follow these steps:

1. Clone the repository
2. Go to `<lab>/infra/terraform` folder
3. Copy `terraform.tfvars.example` to `terraform.tfvars`
4. Update `terraform.tfvars` with your desired values
5. Run Terraform
    ```console
    $ terraform init
    $ terraform plan
    $ terraform apply
    ```

Alternatively, click on `Next` to follow the steps required to successfully deploy a template through GitHub Actions.

>[Next >](./adl-createrepository.md)
