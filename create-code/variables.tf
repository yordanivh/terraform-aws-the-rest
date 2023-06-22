variable "region" {
  description = "aws region"
  default     = "us-east-1"
}

variable "instance_type" {
  description = "the type of the instance"
  type        = string
  default     = "t2.micro"
}


