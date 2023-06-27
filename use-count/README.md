# Terraform configuration for testing the behavior of terraform null_provider, count meta-argument and count.index as a part of configuration.

## Prerequisites

- git
- terraform (>=0.12)
- AWS account
- AWS credentials configured to work with terraform
- Terraform installed localy. 

## VERSIONS: 
```
provider "registry.terraform.io/hashicorp/aws"
  version     = "5.2.0"
  constraints = "~> 4.0"

provider "registry.terraform.io/hashicorp/null" 
  version = "3.2.1" 
```

## Configuration

## Configuration

- Create `main.tf` file
```
resource "ec2_instances" "work" {}
```

### Inputs

| Name  |	Description |	Type |  Default |	Required
| ----- | ----------- | ---- |  ------- | --------
| access_key | Requester AWS access key | string | - | yes
| secret_key | Requester AWS secret key | string | - | yes
| region | Requester AWS region | string | "us-west-2" | no
| count aws_instance | number of resources | number | - | yes

## Initialize terraform and plan/apply

```
$ terraform init
$ terraform plan
$ terraform apply
```

- `Terraform plan` will:
  - create IDs for the instances

- `Terraform apply` will:
  - instances will not be deployed because of the provider
  - state file will be generated
    
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| instance_ids | The IDs of the instances after creation








