provider "aws" {
  region = "us-west-2"
}

provider "aws" {
  alias = "ohio"
  region = "us-east-2"
}


