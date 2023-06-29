terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.4.0"
    }
  }
}

provider "aws" {
  region = var.region
}

provider "aws" {
  alias  = "east"
  region = "us-west-2"
}

module "ec2-instance" {
  source = "./modules/ec2"
  instance_type = var.instance_type
}

module "ec2-instance2" {
  source = "./modules/ec2"
  instance_type = var.instance_type
  providers = {
    aws = aws.east
  }
}

