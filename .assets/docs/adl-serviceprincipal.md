# Deploy a Lab • Setting up Service Principal

A service principal with `Contributor`, `User Access Administrator`, `Private DNS Zone Contributor` and `Network Contributor` rights needs to be generated for authentication and authorization from GitHub to your Azure subscription. This is required to deploy resources to your environment.

### Set Subscription
To connect to the specific Azure subscription using [Azure CLI](https://docs.microsoft.com/cli/azure/install-azure-cli) run `az account set` command. However, before using this command make sure you are connected with the Azure cloud using `az login` account.

```sh
az account set --subscription {subscriptionId}
```

### Create Service Principal

First, go to the Azure Portal to find the ID of your subscription. Then start the [Cloud Shell](https://docs.microsoft.com/en-us/azure/cloud-shell/overview) or [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli), login to Azure, set the Azure context and execute the following commands to generate the required credentials:

```sh
# Replace {service-principal-name} and {subscription-id} with your
# Azure subscription id and any name for your service principal.
az ad sp create-for-rbac \
  --name "{servicePrincipalName}" \
  --role "Contributor" \
  --scopes /subscriptions/{subscriptionId} \
  --sdk-auth
```

This will generate the following JSON output:

```json
{
  "clientId": "<GUID>",
  "clientSecret": "<GUID>",
  "subscriptionId": "<GUID>",
  "tenantId": "<GUID>",
  (...)
}
```

> **Note:** Take note of the output. It will be required for the next steps.

### Adding additional role assigments

For automation purposes, more role assignments are required for the service principal - `User Access Administrator`, `Private DNS Zone Contributor` and `Network Contributor`. To add these role assignments, you can use the [Azure Portal](https://portal.azure.com/) or run the following commands using [Azure CLI](https://docs.microsoft.com/en-us/cli/azure/install-azure-cli).

```sh
# Get Service Principal Object ID
az ad sp list --display-name "{servicePrincipalName}" --query "[].{id:id}" --output tsv

# Add role assignment
az role assignment create \
  --assignee {servicePrincipalObjectId} \
  --role "{roleName}" \
  --scope subscriptions/{subscriptionId} 
```

> **Note:** Repeat this step for each of the role assignment, e.g. `User Access Administrator`.

>[< Previous](./adl-createrepository.md) &nbsp;&nbsp; | &nbsp;&nbsp; 
>[Next >](./adl-deployment-githubactions.md)
