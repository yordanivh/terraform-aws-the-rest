VARIABLES

This repo contains files for testing the behavior of terraform variables.tf file in a given configuration module.

SOURCE - Terraform Registry.

DESCRIPTION

Variables.tf file is a part of a given working directory with terraform files for deploying an infrastructure in a cloud - in our case this is AWS. This file has to main tasks: first one is to avoid hard-coded values
in the main.tf file (hard-coding can make the process of deploying too slow and difficult); the second task is related with the opportunity for other users to change some values in the variables without changing the whole
infrastructure. Those variables can be reusable for another configuration. 

REQUIREMENTS:

Terraform installed localy. Acount in AWS with credentials configured to work with Terraform, witch is installed localy.

VERSIONS: 
provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.4.0"
  constraints = "5.4.0"

  FILES IN THE REPO:

main.tf - his file contains the configuration for the provider. 
variables.tf - this file contains the variables for the main.tf file. And those values are refenced in the main file. And for this demonstration this is the most importand file to explore. For the
goal of this exercise I configured 4 variables: variable "region", variable "instance_type", variable "vpc-cidr" and variable "subnet-cidr". Those variables have their own arguments and values and the last 
ones can be changed without affecting structure of other files of the working directory.
outputs.tf - It contains the values in this file are the final information about given parameters of the deployed resources. 
README - This is the current file. .terraform.lock.hcl - This file is created during the init session.

Commands for testing the efect of this directory

terraform init - during this command all of the required plugins are installed so the terraform core can continue with repoduction.


terraform plan - this is the process I want to give a better overview.







<img width="582" alt="Screenshot 2023-06-25 at 18 43 23" src="https://github.com/dbeleva-af/the-rest/assets/105104959/2e086fd6-1d91-417d-be67-b3f437d8ee32">








This session gives full information of the details of out infrastructure. We can see all the values witch are configured in the variables.tf file before they are created. On this snapshot for example we can
see the cidr_block value from the variables.tf file. And in the main.tf there is only refence to this value - cidr_block = var.vpc-cidr - in the vpc block. 

terraform apply - in this session we can see all the values from the variables.tf file to be applied in the real unfrastructure. We can reuse those values if we need in other parts of a growing infrastructure
or in another one.

terraform destroy - this command results in complete destruction of our test infrastructure. But the important here is unlike the output values (they can change after every apply), variables values
remain the same, unless we change theme in the configuration files. 






















