variable "region" {
  description = "The region for ec2 instance"
  type        = string
  default     = "us-east-1"
}

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  value       = t2.micro
}

variable "vpc-cidr" {
  description = "AWS VPC for the subnets"
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet-cidr" {
  description = "Subnets for aws_vpc"
  type        = string
  default     = "10.0.1.0/24"
}

