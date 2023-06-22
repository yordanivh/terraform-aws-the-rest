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

resource "aws_iam_user" "edu" {
  for_each = var.user-names
  name     = each.value
}

resource "aws_vpc" "net-vpc" {
  cidr_block = var.vpc-cidr
}

resource "aws_subnet" "vpc-subnet" {
  for_each   = var.subnet-cidr
  availability_zone = each.value["availability_zone"]
  cidr_block = each.value["cidr_block"]
  vpc_id     = aws_vpc.net-vpc.id
}
