ONE RESOURCE IN DIFFERENT REGIONS

This repo contains files for testing the configuration deployement via using reusable configuration module. The content in this repo can be used to deploy one resource in multiple regions in a given provider.

SOURCE - Terraform Registry.

DESCRIPTION 
For deployement of the resource its configuration is organized in a child module. Modules in terraform are folders with configuration files that has no provider block configuration and can be used as is in a given configuration. Modules cannot work without a calling configuration - usually the calling file is part of parrent directory. 
Terraform is very flexible tool and can work with local modules (existing in the machine where terraform is running), remote modules from some registry (living on remote source where terraform may not be even installed). Modules can make building configurations much easier - it saves time for the users and authors to write the hole configuration. 
But this can be a risk too - especially when we use modules from remote registry. Usualy users add modules from official source like terraform.registry where the meintainers are other specialists and the it si very good idea to review the remote module before apllying in our infrastructure. And the good thing about using local modules is that 
we have full control over the files in the module folder and its content. For this demonstration I use local module created and used on the same machine where terraform core is running.
And this module will be used to deploy one ec2 instance in 2 region in AWS - us-east-2 (Ohio) and us-west-2 (Oregon) - one configuration, ec2 instances in multiple regions. 

REQUIREMENTS:

Terraform installed localy. Acount in AWS with credentials configured to work with Terraform, witch is installed localy.

VERSIONS: provider "registry.terraform.io/hashicorp/aws" { version = "5.4.0" constraints = "5.4.0"

FILES AND LEVELS IN THE REPO: 

In the folder create-code we can see 2 levels - parrent and a child level. The last one is represented by the folder "modules" - there can be found configurational files for the module. The parrent (calling) module is the upper level and has also .tf files.

PARRENT (CALLING) MODULE: 
main.tf - this file contains the configuration for the provider unlike the child module and the calling modules coresponding with the module directory. 
README.md - This is the current file describing the whole demo. 
outputs.tf - This file is empty.
providers.tf - In this file I created configuration that ensures the deployement of the ec2 in 2 regions: us-east-2 and us-west-2. Us-west-2 is the default redion for the first module ec2, and us-east-2 has alias
as an argument. This alias is refenced in the second module - the ec2 for the second region. When we use multiple regions one of theme is always default, and for the others the alias argument is required.

CHILD MODULE: 
main.tf - Unlike the main in the parrent module, this main slould't reproduce provider configuration and contains only the resources for this module. 
variables - This file is responsible for the values refenced in the main.tf for the module outputs.tf - contains output values from the module. 
.terraform.lock.hcl - in this file is stored the information about the versions and their hashes after the init command.
providers.tf - contains only block with aws provider, no regions.
outputs.tf - contains output values generated after the apply session that can be used further on.

Commands for testing the efect of this directory
terraform init - during this session are installed all the required plugins for the provider and its regions.
terraform plan - after using this command we can see that there are 2 resources to be created using only the configuration from one module. The resources will be created 2 times - one for every region we specified.
terraform apply - after this session we can see the resources deployed in the regions refenced in providers.tf file in the parrent level. 





<img width="746" alt="Screenshot 2023-06-26 at 11 03 50" src="https://github.com/dbeleva-af/the-rest/assets/105104959/acd51a24-8ca0-41c3-978f-9bcf60929dbb">










<img width="1319" alt="Screenshot 2023-06-26 at 11 04 50" src="https://github.com/dbeleva-af/the-rest/assets/105104959/196d2431-c9ee-469a-89c4-d71fbf8bba3b">





The first screenshot shows the instance in Oregon AZ witch is the default region, and the second contains image of the same instance in Ohio AZ.
terraform destroy - this command the resources will be removed from all the regions we specified.







