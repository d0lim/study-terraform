terraform {
  required_version = "1.1.9"

  required_providers {
      aws = ">= 4.15.1"
  }
}

provider "aws" {
  profile = "terraform-test"
  region = "ap-northeast-2"
}