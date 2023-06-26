MULTIPLE USAGE OF ONE MODULE FOR DIFFERENT REGIONS

This repo contains files for testing the configuration deployement via using reusable configuration modules.

SOURCE - Terraform Registry.

DESCRIPTION 
Modules in terraform are folders with configuration files that has no provider block configuration and can be used as is in a given configuration. Modules cannot work without a calling configuration - usually the calling 
file is part of parrent directory. Terraform is very flexible tool and can work with local modules (existing in the machine where terraform is running), remote modules from some registry (living on remote source where terraform may not be even installed). 
Modules can make building configurations much easier - it saves time for the users and authors to write the hole configuration. But this can be a risk too - especially when we use modules from remote registry. Usualy users add modules from official source
like terraform.registry where the meintainers are other specialists and the it si very good idea to review the remote module before apllying in our infrastructure. And the good thing about using local modules is that we have full control over the files in 
the module folder and its content. For this demonstration I use local modules created and used on the same machine where terraform core is running. I created one module at first called "ec2" and used it twice - the second module I called "ec2-2" witch contains
the exactly the same configuration for ec2 instance. And after this the ec2 instaces are deployed in aws in different regions. But this time for every region is created one module. Unlike the previous demo (1resource-2regions) where for all regions is used 
only one module.

REQUIREMENTS:

Terraform installed localy. Acount in AWS with credentials configured to work with Terraform, witch is installed localy.

VERSIONS: provider "registry.terraform.io/hashicorp/aws" { version = "5.4.0" constraints = "5.4.0"

FILES AND LEVELS IN THE REPO:

In the folder modules-regions we can see 2 levels - parrent and a child level. The last one is represented by the folder "modules" witch contains 2 module folders: "ec2" and "ec2-2". The parrent (calling) module is the upper level and has also .tf files.

PARRENT (CALLING) MODULE: 
main.tf - this file contains the configuration for the provider unlike the child module and the calling modules coresponding with the module/ec2 and modules/ec2-2 path. 
variables.tf - avoid hard-coded values in main.tf  
README.md - This is the current file describing the whole demo. 
.terraform.lock.hcl - in this file is stored the information about the versions and their hashes after the init command.
outputs.tf - this file is empty

CHILD MODULES - EC2 AND EC2-2: 
main.tf - Unlike the main in the parrent module, this main slould't reproduce provider configuration and contains only the resources for this module. 
variables - This file is responsible for the values refenced in the main.tf.
outputs.tf - contains output values from the module.

Commands for testing the efect of this directory

terraform init - via this command are installed all the required plugins for the provider configuration in the parrent module. That is why this file exists only in this level - it is not needed in the child directory. 
terraform plan - this command shows the configuration before applying. 
terraform apply - diring this session 2 resources will be created called by the parrent module - 2 aws_instances. But this time 
from two separate similar modules - ec2 and ec2-2 working on one level. 






<img width="746" alt="Screenshot 2023-06-26 at 11 03 50" src="https://github.com/dbeleva-af/the-rest/assets/105104959/acd51a24-8ca0-41c3-978f-9bcf60929dbb">













<img width="1319" alt="Screenshot 2023-06-26 at 11 04 50" src="https://github.com/dbeleva-af/the-rest/assets/105104959/196d2431-c9ee-469a-89c4-d71fbf8bba3b">

















terraform init - via this command are installed all the required plugins for the provider configuration in the parrent module. That is why this file exists only in this level - it is not needed in the child directory. terraform plan - this command shows the configuration before applying. terraform apply - diring this session 3 resources will be created called by the parrent level - aws_vpc, aws_subnet and aws_instance ec2.
