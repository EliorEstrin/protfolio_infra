terraform {
  backend "gcs" {
    bucket = "protfolio-tf"
    prefix = "terraform/state"
  }
}