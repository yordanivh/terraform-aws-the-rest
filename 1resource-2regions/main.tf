module "ec2-1" {
  source = "./modules/"
}

/*
resource "aws_vpc" "ec2-vpc" {
 cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "subnet1" {
 vpc_id = "${aws_vpc.ec2-vpc.id}"
 cidr_block = "10.0.1.0/24"
 availability_zone = "us-east-1a"
}

resource "aws_subnet" "subnet2" {
 vpc_id = "${aws_vpc.ec2-vpc.id}"
 cidr_block = "10.0.2.0/24"
 availability_zone = "us-east-1b"
}
*/


module "ec2-2" {
  source = "./modules/"
  providers = {
    aws = aws.ohio
  }
}

