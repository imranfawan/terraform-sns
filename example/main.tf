
/**
terraform {
  backend "s3" {
    bucket = "<BUCKET>"
    key    = "<BUCKET>/terraform.tfstate"
    region = "<REGION>"
  }
}
**/

provider "aws" {
  version = "~> 2.7.0"
  region  = "eu-west-1"
}


module "sns" {
  #source = "../"
  source = "github.com/imranfawan/terraform-sns?ref=v1.0"
  topic_name = var.topic_name
  sns_role_name = var.sns_role_name
}
