############## Cluster variables ###############
project_id           = "mythic-delight-377411"
region               = "us-central1"
cluster_az           = "us-central1-c"
gke_num_nodes        = 3
machine_type         = "e2-highcpu-8"
cluster_disk_size_gb = 100
cluster_subnet       = "10.10.0.0/24"


############## Argo chart variables ##############
argo_logical_chart_name = "argo"
argo_repository         = "https://argoproj.github.io/argo-helm"
argo_chart_name         = "argo-cd"
argo_chart_version      = "5.19.0"
argo_chart_namespace    = "argo"
argo_values_file_path   = "helm/values.yaml"

############## Argo config variables ##############
gitops_repository_name             = "gitops-repo"
gitops_repo_url                    = "git@github.com:elior7557/protfolio_gitops.git"
gitops_ssh_private_key_secret_name = "protolio-ssh-private-key-gitops"
argocd_apps_repository             = "https://argoproj.github.io/argo-helm"
argocd_apps_chart_version          = "0.0.8"
argocd_apps_values_file_path       = "helm/argo_apps/applications.yaml"

############## sealed secret ##############
sealed_secret_namespace_name  = "sealed-secrets"
sealed_secret_key_secret_name = "sealed-secrets-key"
sealed_secret_tls_crt_secret  = "bitnami-tls-crt"
sealed_secret_tls_key_secret  = "bitnami-tls-key"
