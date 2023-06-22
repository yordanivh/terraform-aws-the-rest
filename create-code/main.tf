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

module "ec2-instance" {
  source = "./modules/ec2"
  instance_type = var.instance_type
}
