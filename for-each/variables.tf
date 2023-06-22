variable "region" {
  description = "The default region for resources" 
  type        = string
  default     = "us-east-1"
}

variable "user-names" {
  description = "Names of IAM users to create"
  type       = set(string)
  default    = ["Lili", "Maria", "Petya"]
}

variable "vpc-cidr" {
  description = "AWS VPC for the subnets" 
  type        = string
  default     = "10.0.0.0/16"
}

variable "subnet-cidr" {
  description = "Subnets for aws_vpc"
  type        = map
  default     = {
    subnet1 = { 
      availability_zone = "us-east-1a"
      cidr_block = "10.0.1.0/24"
    }

    subnet2 = {
      availability_zone = "us-east-1b"
      cidr_block =  "10.0.2.0/24"
    }
  }
}


