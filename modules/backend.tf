terraform {
  backend "s3" {
    bucket  = "siva-tfstate-bucket-123"
    key     = "3tier/prod/terraform.tfstate"
    region  = "ap-south-1"
    encrypt = true
  }
}
