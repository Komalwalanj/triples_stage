provider "aws" {
  region     = var.region


  assume_role{
    role_arn="arn:aws:iam::517826409102:role/triples-stage-deployment-role"
  } 
}

locals {
  tags = {
    BusinessFunction = var.business_function
    OwnerEmail       = var.owner_email
    ContactEmail     = var.contact_email
    Platform         = var.platform
    CostCenter       = var.cost_center
    Application      = var.application
    Purpose          = var.purpose
    Environment      = var.environment
    CreatedByEmail   = var.created_by_email
  }

}


terraform {
  backend "s3" {
    bucket         = "terraform-backend-dev-517826409102-statefile-bucket"
    key            = "terraform-backend-dev-517826409102-statefile-bucket/triples/stage/terraform.tfstate"
    region         = "eu-central-1"
    dynamodb_table = "terraform-backend-dev-statefile-dynamodb" 
    encrypt        = true
    role_arn       = "arn:aws:iam::517826409102:role/triples-stage-deployment-role"
    kms_key_id     = "arn:aws:kms:eu-central-1:517826409102:key/aabedc78-68fa-49d3-864d-4ead1dd2aaab"
}

}