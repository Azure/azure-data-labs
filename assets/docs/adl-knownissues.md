# az-labs-data • FAQ & Known Issues

## 📘 FAQ

### How I can spin up multiple lab environments using the same template?

You can just change the `prefix` and/or `postfix` values from config-lab.yml in each blueprint and trigger a new deployment.

### Is there a way to manage deployments from Azure?

Not yet. We´re working with Azure DevTest Labs and other engineering group to make az-labs-data blueprints [Azure Deployment Environments](https://techcommunity.microsoft.com/t5/azure-developer-community-blog/introducing-azure-deployment-environments/ba-p/3412095) compatible, so you can manage blueprints and deployments from Azure UI.

### How can I create a new blueprint?

You can use the [Azure Labs Modules](https://github.com/microsoft/azure-labs-modules) to create your own blueprints. 

## 📕 Known Issues

### Error: 403 retrieving File System "default" in Storage Account

Error Message:

> Error: retrieving File System "default" in Storage Account "stdata03001": datalakestore.Client#GetProperties: Failure responding to request: StatusCode=403 -- Original Error: autorest/azure: error response cannot be parsed: {"" '\x00' '\x00'} error: EOF

Solution: 

This error message appears when a GitHub Actions is triggered more than once. The workflows tries to check container access using an IP not whitelisted in the Storage Account firewall by the previous deployment [https://api.github.com/meta](https://api.github.com/meta). Eventually, we recommended to manually open Storage Account firewall by clicking `Enabled from all networks` to make the re-run work.

>[< Previous](./adl-deployment-githubactions.md)
