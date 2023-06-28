# Terraform configuration for testing the results from the usage of "for_each" meta-argument AWS

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
For_each meta-argument is very convinient way to create similar or equal resources and makes dependencies between those resources. In some use cases is better to use count, 
but for other for_each works better. To manage several of the same resources, we can use either count or for_each, which removes the need to write a separate block of code 
for each one. Using these options reduces overhead and makes our code neater. the for_each meta-argument creates multiple instances of a module or resource block. However, 
instead of specifying the number of resources, the for_each meta-argument accepts a map or a set of strings. This is useful when multiple resources are required that have different values.


## Configuration

- Create `main.tf` file
    ```
    resource "aws_iam_user" "edu" {}
    resource "aws_vpc" "net-vpc" {}
    resource "aws_subnet" "vpc-subnet" {}
    ```
    
    - Create `variables.tf` file
    ```
    variable "region" {}
    variable "user-names" {}
    variable "vpc-cidr" {}
    variable "subnet-cidr" {}
    ```
   
    - Create `outputs.tf` file
    ```
    output "IAM-user-id" {
    description = "The ids of IAM users created"
    value       = {for k, v in aws_iam_user.edu: k => v.id}
    }

    output "vpc-id" {
    description = "The IDs of created subnets"
    value       = {for k, v in aws_subnet.vpc-subnet: k => v.id}
    }
    ```


## Inputs

| Name  |	Description |	Type |  Default |	Required
| ----- | ----------- | ---- |  ------- | --------
| access_key | Requester AWS access key | string | - | yes
| secret_key | Requester AWS secret key | string | - | yes
| region | Requester AWS region | string | "us-east-1" | no
| user-names | names of IAM users | set(string) | Lili", "Maria", "Petya | yes
| vpc-cidr | CIDR block for the vpc | string | 10.0.0.0/16 | yes
| subnet-cidr | CIDR block for the subnets | string | 10.0.1.0/24, 10.0.2.0/24 | yes 


## Initialize terraform and plan/apply

```
$ terraform init
$ terraform plan
$ terraform apply
```

- `Terraform apply` will:
  - create IAM users for every key vaule in the variables 
  - create virtual private cloud
  - create aws_subnet for every maped value in the variable block
    
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| IAM-user-id | ID for every user
| vpc-id  | ID for the VPC
| subnet-id | ID for every subnet in the VPC

