variable "region" {
  description  = "The name of the required region"
  type  = string
  default = "us-west-2"
}

variable "ami_id" {
  name  = "ID of the ami for this region to be used"
  value = ami-080f7286ffdf988ee
}

