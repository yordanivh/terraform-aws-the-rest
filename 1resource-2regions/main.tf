module "ec2-1" {
  source = "./modules/"
}

module "ec2-2" {
  source = "./modules/"
  providers = {
    aws = aws.ohio
  }
}

