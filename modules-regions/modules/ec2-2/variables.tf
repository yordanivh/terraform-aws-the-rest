/*
variable "region" {
  description = "The region for ec2 instance"
  type        = string
  default     = "us-east-2"
}
*/

variable "instance_type" {
  description = "ec2 instance type"
  type        = string
  default     = "t2.micro"
}

