# Create New Template • Deployment 

You can deploy a lab using Terraform (as shown before) or using GitHub Actions workflow. To use the later, you need to:

- Configure the config-lab.yml. This file is used by the GitHub Actions workload to override the default values on variables.tf file.
- Create a new GitHub Actions workload. You can copy any of the existing workloads here, and change to appropiate folders/files.

Once your workload is avaiable, you can run it using a manual trigger.

Done! Your lab is ready to be deploying from GitHub. 
