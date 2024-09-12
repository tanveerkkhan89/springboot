terraform {
  backend "s3" {
    bucket         = "rakbankdemo3"
    key            = "terraform/state.tfstate"
    region         = "us-east-2"
    dynamodb_table = "terraform-lock-table3"
  }
}