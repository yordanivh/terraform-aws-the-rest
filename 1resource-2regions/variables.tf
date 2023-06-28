variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

variable "region" {
  description = "The default provider for the first instance"
  type        = string
  default     = "us-west-2"
}
