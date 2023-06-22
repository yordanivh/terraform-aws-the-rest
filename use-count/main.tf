terraform {
  required_providers {
    null = {
      source  = "hashicorp/null"
      version = "3.2.1"
    }
  }
}

provider "null" {}

resource "ec2_instances" "work" {
  name  = "my-ec2"
  instance_type = "t2.micro"
  count = 2

  tags = {
    Name = "Work ${count.index}"
  }
}
  

