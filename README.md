# Terraform configurations for deployement of resources using different terraform workflows

## Description
    This directory contains folders with configurational files for deploying resources in AWS cloud. I will describe every one of theme.

  - 1RESOURCE-2REGIONS - This directory contains configurational files for deploying 1 resource via modul in multiple regions. It has two levels - parrent and child modules.

  - CREATE-CODE - This directory shows how to use a diven configuration as a separate module. It is two leveled too.

  - FOR-EACH - In this folder you can find files with configuration with the usage of the for_each meta-argument for creating multiple resources from one resource block.

  - MODULES-REGIONS - With this configuration you can reuse one module and create new one and deploy the configuration in multiple regions. 

  - OUTPUT - In this directory you can find configuration that is oriented around the efect of the outputs.tf file. After apply the output values are visible.

  - PANDOM_PET - example on how to use the terraform random_pet resource.

  - USE-COUNT - This directory contains files for deploying equal resources from one resource block. But unlike the for_each here we have specific number of resources.

  - VARIABLES - In this folder the accent is on the efekt of using variable values in a separate file.

  - .gitignore - in this file are listed all the file types that shouldn't be commited in privet repository

  - README.md - this file

## Testing 
    All of the configurations are tested on MacOS M2 and works as expected. Plugin versions are shown printed in 
    .terraform.lock.hcl file witch is generated after the init session. The commands used for testing are:
   
    $ terraform init
    $ terraform plan
    $ terraform apply
    $ terraform destroy
    

## Conclusion 
    Terraform OSS develops fast and with every new version of the tool there can be some changes (for good), so it is a good 
    idea to keep the installed tool up to date. tfenv can help to achieve this. I listed the versions I used in every subfolder 
    but your ones can be different and this can cause different behavior when using another provider or terraform version.  
