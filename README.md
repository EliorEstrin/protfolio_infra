# DevOps Protfolio - Infra Repo

This repository contains the necessary Terraform files to deploy the infrastructure of [this application](https://github.com/elior7557/protfolio-DevOps-application.git) , it deploys a GKE (Google Kubernetes Engine) cluster in Google Cloud. The repository has 3 modules which are as follows:

 * **module "cluster"**: This module deploys the GKE cluster.
 * **module "argocd"**:  This module deploys on the GKE cluster argocd with 2 applications: the app itself and the helm charts that used as a dependency for the app, [see here](helm/argo_apps/applications.yaml) . for more info see [gitops repositroy](https://github.com/elior7557/protfolio_gitops.git)
 * **module "sealed-secret"**: This module deploys sealed secrets into the cluster, and the keys origin is in GCP (Google Cloud Platform) Secret Manager.

# Providers
 * **helm**: This provider is used to manage Kubernetes applications.
 * **kubernetes**: This provider is used to interact with Kubernetes clusters.
 * **google**: This provider is used to interact with Google Cloud.

## Recomanded Configuration
- see `terrafrom.tfvars`
- configure a project in gcp with k8s api enabled
- [gitops repositroy](https://github.com/elior7557/protfolio_gitops.git) in order to deploy application charts.
- In the gitops repository make sure that there is an ingress controller and preferably static ip for the ingress.
  
### Note
sealed secrets are used as a dependency for this application to work.


# The Result after Terrarom Apply

![argocd](./tf-apply.png)
