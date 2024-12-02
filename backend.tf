terraform {
  backend "s3" {
    bucket = "terraform-backend"
    key    = "two-tier/terraform.tfstate"
    region = "eu-west-1"
    dynamodb_table = "terraform-state"
  }
}
