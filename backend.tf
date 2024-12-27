terraform {
  backend "s3" {
    bucket         = "terraform-state-alfonso"
    key            = "terraform/state/terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "terraform-state-alfonso"
    acl            = "private"
  }
}
