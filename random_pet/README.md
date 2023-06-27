# Terraform configuration for deploying Amazon Machine Image and ec2 instance using the random_pet resource

## Prerequisites

- git
- terraform (>=0.12)
- AWS account
- AWS credentials configured to work with terraform
- Terraform installed localy. 

## VERSIONS: 
```
provider "registry.terraform.io/hashicorp/aws"
  version     = "4.67.0"
  constraints = "~> 4.0"

provider "registry.terraform.io/hashicorp/random" 
  version = "3.5.1" 
```

## Configuration

- Create `main.tf` file
```
data "aws_ami" "ubuntu" {}
resource "random_pet" "server" {}
resource "aws_instance" "server" {}
```
  
- Create `variables.tf` file
```
variable "region" {}
variable "instance_type" {}
```

- Create `outputs.tf` file
```
output "ami_id" {
  description = "The AMI ID after apply"
  value       = data.aws_ami.ubuntu.id
}

output "server_id" {
  description = "The id after apply"
  value       = resource.aws_instance.server.id
}
```

### Inputs

| Name  |	Description |	Type |  Default |	Required
| ----- | ----------- | ---- |  ------- | --------
| access_key | Requester AWS access key | string | - | yes
| secret_key | Requester AWS secret key | string | - | yes
| region | Requester AWS region | string | "us-west-2" | no
| ami_id | AMI ID for server | string | yes

### Initialize terraform and plan/apply

```
$ terraform init
$ terraform plan
$ terraform apply
```

- `Terraform apply` will:
  - create AMI 
  - create ec2 instance and random_pet resource
    
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| ami_id | The ID of ami after creation
| server ID  | ID of the resource named server















  
