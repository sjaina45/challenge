provider "aws" {
  region = "us-east-1"
  //version = " 2.4.0"
}

terraform {
  backend "s3" {}
}