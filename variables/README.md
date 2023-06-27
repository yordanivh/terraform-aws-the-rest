# Terraform configuration for testing the behavior of terraform variables.tf file in a given configuration module.

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

Variables.tf file is a part of a given working directory with terraform files for deploying an infrastructure in a cloud - in our case this is AWS. This file has to main tasks: first one is to avoid hard-coded values
in the main.tf file (hard-coding can make the process of deploying too slow and difficult); the second task is related with the opportunity for other users to change some values in the variables without changing the whole
infrastructure. Those variables can be reusable for another configuration. 

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
variable "region" {}
variable "instance_type" {}
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
| ami_id | AMI ID for  | string | yes
| instance_type | Instance type for the ec2 | string | t2.micro | yes
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
  - create VPC for the instance
  - create subnet for the instance in the VPC 
  - create ec2 instance with output values
    
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| ami_id | The ID of ami after creation
| instance ID  | ID of the resource named web
| vpc_id | ID for the VPC after creation
| subnet_id | ID for the subnet after creation


