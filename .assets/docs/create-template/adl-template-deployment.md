# Create New Template • Deployment 

You deploy a lab using Terraform (as shown before) or using GitHub Actions workflow. To use the later, you need to:

- Configure the config-lab.yml, setting up the appropiate default values for variables. This file is used by the GitHub Actions workload to override the default values on variables.tf file.
- Create a new GitHub Actions workload. You can copy any of the existing workloads here, and change to appropiate folders/files.

Once you push these changes your new workload will be available withing the Actions tab. You would be able to run it using a manual trigger.

Done! Your lab is ready to be deploying from GitHub. 
