project_id    = "mythic-delight-377411"
region        = "us-central1"
cluster_az    = "us-central1-c"
gke_num_nodes = 3
machine_type  = "e2-highcpu-8"

argo_logical_chart_name = "argo"
argo_repository         = "https://argoproj.github.io/argo-helm"
argo_chart_name         = "argo-cd"
argo_chart_version      = "5.19.0"
argo_chart_namespace    = "argo"
argo_values_file_path   = "helm/values.yaml"
//argo config
gitops_repository_name             = "gitops-repo"
gitops_repo_url                    = "git@github.com:elior7557/protfolio_gitops.git"
gitops_ssh_private_key_secret_name = "protolio-ssh-private-key-gitops"
argocd_apps_repository             = "https://argoproj.github.io/argo-helm"
argocd_apps_chart_version          = "0.0.8"
argocd_apps_values_file_path       = "helm/argo_apps/applications.yaml"