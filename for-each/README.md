FOR-EACH

This repo contains files for testing the results from the "for_each" meta-argument when creating resources in a given cloud.

SOURCE - Terraform Registry.

DESCRIPTION
For_each meta-argument is very convinient way to create similar or equal resources and makes dependencies between those resources. In some use cases is better to use count, but for other for_each works 
better. To manage several of the same resources, we can use either count or for_each, which removes the need to write a separate block of code for each one. Using these options reduces 
overhead and makes our code neater. the for_each meta-argument creates multiple instances of a module or resource block. However, instead of specifying the number of resources, the for_each meta-argument 
accepts a map or a set of strings. This is useful when multiple resources are required that have different values.

REQUIREMENTS:

Terraform installed localy. Acount in AWS with credentials configured to work with Terraform, witch is installed localy.

VERSIONS: provider "registry.terraform.io/hashicorp/aws" { version = "5.4.0" constraints = "5.4.0".

FILES IN THE REPO:

main.tf - this file contains the configuration for the resources. Multiple resources will be created from one resource block.
outputs.tf - contains the output values generated after the apply session. There will be output values for each subnet. 
variables.tf - here is the most important variable for the demo - variable "subnet-cidr". This block contains a map ot values. For each of these values (subnet cidrs) will be created the same count of subnets
that will map every cidr_block. 
README.md - the current file. It describes the whole demo
.terraform.lock.hcl - in this file is stored the information about the versions and their hashes after the init command.

TESTING

Command for testing the demo configuration
terraform init - during this session are installed all the required plugins. 
terraform plan - after using this command we can see that there are 3 resources to be created - 1 aws_vpc and 2 aws_subnets.




<img width="393" alt="Screenshot 2023-06-26 at 12 22 02" src="https://github.com/dbeleva-af/the-rest/assets/105104959/62cb5399-9823-4ad6-b12f-e168656e0421">






terraform apply - the resources will be applied in AWS.






<img width="843" alt="Screenshot 2023-06-26 at 12 23 54" src="https://github.com/dbeleva-af/the-rest/assets/105104959/85e4bb93-5864-4019-80b4-88b0d728f8a8">






The second subnet is default and it is not part of the last applied configuration. But we can see 2 subnets, one for each cidr_block from the variables.tf file.








<img width="491" alt="Screenshot 2023-06-26 at 12 26 26" src="https://github.com/dbeleva-af/the-rest/assets/105104959/d1724ea6-d38a-419a-9b9b-a8782cbcc632">








On the last screenshot we can see the outputs for the subnets - those outputs are created after deployement. 

terraform destroy - this command destroys all the resources we created with this configuration.















