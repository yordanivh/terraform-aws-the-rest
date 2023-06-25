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
