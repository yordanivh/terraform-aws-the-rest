# Terraform configuration for testing the behavior of terraform outputs.tf file in a given configuration module.

## Prerequisites

- git
- terraform (>=1.5)
- AWS account
- AWS credentials configured to work with terraform
- Terraform installed localy. 

## VERSIONS: 
```
provider "registry.terraform.io/hashicorp/aws"
  version     = "5.4.0"
```

### DESCRIPTION

The outputs.tf file is a part of the structure in configurational folder that contains all necesary .tf files for defining a given infrastructire in AWS cloud. After every apply it gives end values for given resource parameters. The information from the outputs can be used for other configurations, and that makes the information reusable. The information from the outputs can be used as a data source for another Terraform workspace. Outputs are also how you expose data from a child module to a root module. 

## Configuration

- Create `main.tf` file
```
data "aws_ami" "ubuntu" {}
resource "aws_instance" "web" {}
resource "aws_vpc" "net-vpc" {}
resource "aws_subnet" "vpc-subnet" {}
```
  
- Create `variables.tf` file
```
variable "vpc-cidr" {}
variable "subnet-cidr" {}
```

- Create `outputs.tf` file
```
output "ami_id" {
  description = "The AMI ID after apply"
  value       = data.aws_ami.ubuntu.id
}

output "instance_id" {
  description = "The id after apply"
  value       = resource.aws_instance.web.id
}
```

### Inputs

| Name  |	Description |	Type |  Default |	Required
| ----- | ----------- | ---- |  ------- | --------
| access_key | Requester AWS access key | string | - | yes
| secret_key | Requester AWS secret key | string | - | yes
| region | Requester AWS region | string | "us-east-1" | no
| ami_id | AMI ID for server | string | yes
| VPC cidr_block | CIDR for the vpc | string | 10.0.0.0/16 | yes
| subnet cidr_block | CIDR for the subnet | string | 10.0.1.0/24 | yes 

### Initialize terraform and plan/apply

```
$ terraform init
$ terraform plan
$ terraform apply
```

- `Terraform apply` will:
  - create AMI 
  - create ec2 instance with output values
    
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| ami_id | The ID of ami after creation
| instance ID  | ID of the resource named web
| vpc_id | ID for the VPC after creation
| subnet_id | ID for the subnet after creation

