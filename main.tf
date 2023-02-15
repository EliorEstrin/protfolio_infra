module "cluster" {
  source        = "./modules/cluster"
  project_id    = var.project_id
  region        = var.region
  cluster_az    = var.cluster_az
  gke_num_nodes = var.gke_num_nodes
  machine_type  = var.machine_type
}

module "argocd" {
  source             = "./modules/argocd"
  chart_logical_name = var.argo_logical_chart_name
  repository         = var.argo_repository
  chart_name         = var.argo_chart_name
  chart_version      = var.argo_chart_version
  chart_namespace    = var.argo_chart_namespace
  values_file_path   = var.argo_values_file_path

  // Argo configuration
  repository_name             = var.gitops_repository_name
  repo_url                    = var.gitops_repo_url
  ssh_private_key_secret_name = var.gitops_ssh_private_key_secret_name

  argocd_apps_repository       = var.argocd_apps_repository
  argocd_apps_chart_version    = var.argocd_apps_chart_version
  argocd_apps_values_file_path = var.argocd_apps_values_file_path

  depends_on = [
    module.cluster
  ]
}


module "sealed-secrets" {
  source         = "./modules/sealed_secrets"
  namespace_name = var.sealed_secret_namespace_name
  secret_name    = var.sealed_secret_key_secret_name
  tls_crt_secret = var.sealed_secret_tls_crt_secret
  tls_key_secret = var.sealed_secret_tls_key_secret

  depends_on = [
    module.cluster
  ]
}