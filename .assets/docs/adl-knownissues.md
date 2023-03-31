# Azure Data Labs • FAQ & Known Issues

## 📘 FAQ

### How I can spin up multiple lab environments using the same template?

You can just change the `prefix` and/or `postfix` values in the config-lab.yml for each template and trigger a new deployment.

### Is there a way to manage deployments from Azure?

Not yet. We´re working with [Azure DevTest Labs](https://azure.microsoft.com/en-us/products/devtest-lab) and other engineering groups to make Azure Data Labs templates  compatible with [Azure Deployment Environments](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/introducing-azure-deployment-environments/ba-p/3412095), so that you can manage templates and deployments from Azure UI.

### How can I create a new template?

You can use the [Azure Data Labs Modules](https://github.com/Azure/azure-data-labs-modules) to create your own templates, see [Create a New Template](./adl-createanewtemplate.md).

## 📕 Known Issues

### Error: 403 retrieving File System "default" in Storage Account

Error Message:

> Error: retrieving File System "default" in Storage Account "stdata03001": datalakestore.Client#GetProperties: Failure responding to request: StatusCode=403 -- Original Error: autorest/azure: error response cannot be parsed: {"" '\x00' '\x00'} error: EOF

Solution: 

This error message appears when a GitHub Actions is triggered more than once. The workflows tries to check container access using an IP not whitelisted in the Storage Account firewall by the previous deployment [https://api.github.com/meta](https://api.github.com/meta). Eventually, we recommended to manually open Storage Account firewall by clicking `Enabled from all networks` to make the re-run work.

>[< Previous](./adl-deployment-githubactions.md)
