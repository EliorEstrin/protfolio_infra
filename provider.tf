terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = "4.27.0"
    }
    helm = {
      source  = "hashicorp/helm"
      version = "2.8.0"
    }

    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = ">= 2.0.1"
    }
  }
  required_version = ">= 0.14"

}

provider "google" {
  project = "mythic-delight-377411"
  region  = "us-central1"
}


provider "helm" {
  kubernetes {
    host                   = "https://${module.cluster.kubernetes_cluster_host}"
    token                  = module.cluster.access_token
    cluster_ca_certificate = module.cluster.cluster_ca_certificate
  }
}


provider "kubernetes" {
  host                   = "https://${module.cluster.kubernetes_cluster_host}"
  token                  = module.cluster.access_token
  cluster_ca_certificate = module.cluster.cluster_ca_certificate
}