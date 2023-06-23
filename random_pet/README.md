RANDOM_PET

In this repository you can find an example on how to use the terraform random_pet resource. For this demo I use tow resources - the random_pet and aws_instance resources - to show what exactly is doing the first one. This type of resource is very usefull to create a unique name for a given resouce. This name is the identifier of the resource istelf - in this example we talk about the name of the server we create in AWS. Random_pet can be used with create_before_destroy lifecycle flag witch can help avoiding problems during destruction of old and creation of new resources in the given cloud.

SOURCE - Terraform Registry.

REQUIREMENTS:

Terraform installed localy. 

VERSIONS: 

All provider versions can be seen in .terraform.lock.hcl file after using the command "terraform init".
provider "registry.terraform.io/hashicorp/aws" {
  version     = "4.67.0"
  constraints = "~> 4.0"

  provider "registry.terraform.io/hashicorp/random" {
  version = "3.5.1" 

FILES IN THE REPO

main.tf - this file contains the configuration for the resources
variables.tf - thit file contains variables that can be changed with other values
outputs.tf - this file contains the values for given parameters as end result, that can be used in other configurations. In this case we need the IDs of the server itself and AMI image for that server.

README.md - This document. It describes the most important about this repo. 

.gitignore - file with type of files that shouldn't be commited in the publick repository.

TESTING





  
