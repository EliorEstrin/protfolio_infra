terraform {
  backend "gcs" {
    bucket = "protfolio-tf"
    prefix = "terraform/state"
  }
}


data "terraform_remote_state" "gke" {
  backend = "gcs"

  config = {
    bucket = "protfolio-tf"
    prefix = "terraform/state/default.tfstate"
  }
}
