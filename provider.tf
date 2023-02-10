terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
  }
  required_version = ">= 0.14"
}


provider "google" {
  project     = "mythic-delight-377411"
  region      = "us-central1"
}

