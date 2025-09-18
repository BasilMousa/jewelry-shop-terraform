terraform {
  backend "s3" {
  bucket         = "jewelry-shop-basil-terraform"
    key            = "jewelry-shop-terraform/terraform.tfstate"
    region         = var.aws_region
  dynamodb_table = "jewelry-shop-lock-table-basil"
    encrypt        = true
  }
}
