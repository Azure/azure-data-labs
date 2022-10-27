# Azure Data Labs • GitHub Actions Deployment

In the previous step we have generated a JSON output similar to the following while creating the Service Principal. This will be required in the next steps.

```json
{
  "clientId": "<GUID>",
  "clientSecret": "<GUID>",
  "subscriptionId": "<GUID>",
  "tenantId": "<GUID>",
  (...)
}
```

### Adding Secrets to GitHub repository

If you want to use GitHub Actions for deploying the resources, add the following [repository secrets](https://docs.github.com/en/actions/security-guides/encrypted-secrets#creating-encrypted-secrets-for-a-repository) in your GitHub repository. User information is also required to give e.g., Synapse Administrator access to a particular user and not only to Service Principal.

| Secret name | Value |
| - | - |
| `AZURE_CREDENTIALS` | the entire JSON output |
| `ARM_CLIENT_ID` | `clientId` from JSON output |
| `ARM_CLIENT_SECRET` | `clientSecret` from JSON output |
| `ARM_SUBSCRIPTION_ID` | `subscriptionId` from JSON output |
| `ARM_TENANT_ID` | `tenantId` from JSON output |
| `USER_OBJECT_ID` | Your Azure AD `objectId` |
| `USER_TENANT_ID` | Your Azure AD `tenantId` |
| `USER_EMAIL` | Your Azure AD login name |

### Update lab parameters (config-lab.yml)

To deploy a lab to the desired Azure subscription, you will need to modify some parameters to the appropiate blueprint in the forked repository. There is only one file that requires updates - `config-lab.yml`, as follows:

| Config param | Description |
| - | - |
| `prefix` | a prefix value for the naming convention e.g. `azlabs03` |
| `postfix` | a postfix value for the naming convention e.g. `0023` |
| `location` | set `northeurope` or  `westus2` |
| `terraform_st_resource_group` | resource group name |
| `terraform_st_storage_account` | storage account name for Terraform state |

> **Note:** Enable / disable different feature flags as needed as well.

### Merge changes to main

Update this file in a seperate branch and then merge it via Pull Request to `main` before triggering a deployment.

### Deploy a lab

Now, you can navigate to the Actions tab of the main page of the repository, where you will see a list of workflows. Select the lab you want to deploy and click **Run workflow**. Congratulations! You have successfully executed all steps to deploy a lab into your environment through GitHub Actions.

Click on it to see how it deploys the environment. If you run into any [issues](https://github.com/microsoft/azure-labs-data/issues), please check the [Known Issues](https://github.com/microsoft/azure-labs-data/blob/main/assets/docs/adl-knownissues.md) first and open an issue if you come accross a potential bug in the repository.

>[< Previous](./adl-serviceprincipal.md) &nbsp;&nbsp; | &nbsp;&nbsp; 
>[Next >](./adl-knownissues.md)
