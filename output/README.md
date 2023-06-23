OUTPUT

This repo contains files for testing the behavior of terraform outputs.tf file in a given configuration module.

SOURCE - Terraform Registry.

DESCRIPTION

The outputs.tf file is a part of the structure in configurational folder that contains all necesary .tf files for defining a given infrastructire in AWS cloud. After every apply it gives
end values for given resource parameters. The information from the outputs can be used for other configurations, and that makes the information reusable. The information from the outputs
can be used as a data source for another Terraform workspace. Outputs are also how you expose data from a child module to a root module. 

REQUIREMENTS:

Terraform installed localy.
Acount in AWS with credentials configured to work with Terraform, witch is installed localy. 

VERSIONS: 
provider "registry.terraform.io/hashicorp/aws" {
  version     = "5.4.0"
  constraints = "5.4.0"

FILES IN THE REPO:

main.tf - his file contains the configuration for the provider.
variables.tf - this file contains the variables for the main.tf file. This file is a way to avoid the hard-coded values in the main.tf file. And those values are refenced in the main file.
outputs.tf - This file is the BIG hero in this repo. It contains the values in this file are the final information about given parameters of the deployed resources. In this case we want to reproduse the output "ami_id" and output "instance_id".
README - This is the current file.
.terraform.lock.hcl - This file is created during the init session.

TESTING
terraform init





<img width="561" alt="Screenshot 2023-06-23 at 17 21 38" src="https://github.com/dbeleva-af/null_provider/assets/105104959/6254affc-a0fd-456f-9016-7af56d5aefe7">










terraform plan and terraform apply









<img width="486" alt="Screenshot 2023-06-23 at 17 24 36" src="https://github.com/dbeleva-af/null_provider/assets/105104959/bc991126-02db-4304-a3d8-3369a776ba24">










terraform destroy

About this demonstration the most important session is the during terraform apply, and generated output values after the session. We can see the ami_id and instance_id.









