terraform {
  backend "s3" {
    bucket = "terraform-state-lvg"
    key    = "Prod/terraform.tfstate"
    region = "us-west-2"
  }
}
