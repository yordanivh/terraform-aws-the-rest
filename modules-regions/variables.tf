variable "region" {
  description = "aws region for the first ec2 module"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "the type of the instance"
  type        = string
  default     = "t2.micro"
}

