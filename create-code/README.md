# Terraform configuration for creation of module to deploy an ec2 instance in AWS

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
Modules in terraform are folders with configuration files that has no provider block configuration and can be used as is in a given configuration. Modules cannot work without 
a calling configuration - usually the calling file is part of parrent directory. Terraform is very flexible tool and can work with local modules (existing in the machine where 
terraform is running), remote modules from some registry (living on remote source where terraform may not be even installed). Modules can make building configurations much easier
- it saves time for the users and authors to write the hole configuration. But this can be a risk too - especially when we use modules from remote registry. Usualy users add modules from official source like terraform.registry where the meintainers are other specialists and the it si very good idea to review the remote module before apllying in
- our infrastructure. And the good thing about using local modules is that we have full control over the files in the module folder and its content. For this demonstration I
- use local module created and used on the same machine where terraform core is running.


## FILES AND LEVELS IN THE REPO:


  ### PARRENT (CALLING) MODULE: 
    - Create `main.tf` file
    ```
    module "ec2-instance" {}
    ```
    
    - Create `variables.tf` file
    ```
    variable "region" {}
    variable "instance_type" {}
    ```

  ### CHILD MODULE:

    - Create `main.tf` file
    ```
    data "aws_ami" "ubuntu" {}
    resource "aws_instance" "web" {}
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
| region | Requester AWS region | string | "us-east-1" | no
| ami_id | AMI ID for server | string | yes
| instance_type | The type of the ec2 | string | t2.micro | yes
| module/ec2 | Reusable module | - | - | yes 


## Initialize terraform and plan/apply

```
$ terraform init
$ terraform plan
$ terraform apply
```

- `Terraform apply` will:
  - create AMI 
  - create ec2 instance from the resource block in parrent main.tf calling the ec2 module
    
#### Outputs

| Name  |	Description 
| ----- | ----------- 
| ami_id | The ID of ami after creation
| instance ID  | ID of the resource named web



    







<img width="320" alt="Screenshot 2023-06-26 at 10 09 13" src="https://github.com/dbeleva-af/the-rest/assets/105104959/db1f35d9-a71a-4aef-8197-dde9d32a5c3e">








On the screenshot we can see that in AWS there is one instance running - the ec2 instance called from the modules/ec2 path.
terraform destroy - with this command the whole infrastructure is removed from the cloud.














  
