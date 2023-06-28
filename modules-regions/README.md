# Terraform configuration for multiple usage in different regions

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
Modules in terraform are folders with configuration files that has no provider block configuration and can be used as is in a given configuration. Modules cannot work without a calling configuration - usually the calling file is part of parrent directory. Terraform is very flexible tool and can work with local modules (existing in the machine where terraform is running), remote modules from some registry (living on remote source where terraform may not be even installed). Modules can make building configurations much 
easier - it saves time for the users and authors to write the hole configuration. But this can be a risk too - especially when we use modules from remote registry. Usualy users add modules from official source like terraform.registry where the meintainers are other specialists and the it si very good idea to review the remote module before apllying 
in our infrastructure. And the good thing about using local modules is that we have full control over the files in the module folder and its content. For this demonstration I 
use local modules created and used on the same machine where terraform core is running. I created one module at first called "ec2" and used it twice - the second module I called "ec2-2" witch containsthe exactly the same configuration for ec2 instance. And after this the ec2 instaces are deployed in aws in different regions. But this time for every region
is created one module. Unlike the previous demo (1resource-2regions) where for all regions is used only one module.

## FILES AND LEVELS IN THE REPO:

  ### PARRENT (CALLING) MODULE: 
    
    - Create `main.tf` file
    ```
    provider "aws" {
      region = var.region
    }

    provider "aws" {
      alias  = "east"
      region = "us-east-2"
    }
    module "ec2-instance" {}
    module "ec2-instance2" {}
    ```
    
    - Create `variables.tf` file
    ```
    variable "region" {}
    variable "instance_type" {}
    ```

    ### CHILD MODULE 1:

    - Create `main.tf` file
    ```
    data "aws_ami" "ubuntu" {}
    resource "aws_instance" "web" {}
    ```
    
    - Create `variables.tf` file
    ```
    variable "instance_type" {}
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

    ### CHILD MODULE 2:

    - Create `main.tf` file
    ```
    data "aws_ami" "ubuntu" {}
    resource "aws_instance" "web" {}
    ```
    
    - Create `variables.tf` file
    ```
    variable "instance_type" {}
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

## Inputs

| Name  |	Description |	Type |  Default |	Required
| ----- | ----------- | ---- |  ------- | --------
| access_key | Requester AWS access key | string | - | yes
| secret_key | Requester AWS secret key | string | - | yes
| default region | Requester AWS region | string | us-west-2 | yes
| second region | The second region | alias | us-east-2 | yes
| instance_type | The type of the instances | string | t2.micro | yes
| module "ec2" | Calling block for the first region | module | - | yes


## Initialize terraform and plan/apply

```
$ terraform init
$ terraform plan
$ terraform apply
```

- `Terraform apply` will:
  - create equal resources using one 2 modules for 2 different regions
  - create 2 equal AMIs for the instances in those regions 
  
    
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| ami_id | ID for aws_instances AMI
| instance_id 1 | ID for the instance in the default region
| instance_id 2 | ID for the instance in the alias region
