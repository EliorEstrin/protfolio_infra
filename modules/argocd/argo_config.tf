
### Repositories configuration for argo ###
resource "kubernetes_secret" "repo" {
  metadata {
    name      = var.repository_name
    namespace = var.chart_namespace

    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    "type"          = "git"
    "url"           = var.repo_url
    "sshPrivateKey" = data.google_secret_manager_secret_version.private-key.secret_data
  }
  type = "Opaque"

  depends_on = [
    helm_release.argo
  ]
}

# argocd application to start with cluster setup
resource "helm_release" "argocd-apps" {
  chart      = "argocd-apps"
  name       = "argocd-apps"
  namespace  = var.chart_namespace
  version    = var.argocd_apps_chart_version
  repository = var.argocd_apps_repository

  depends_on = [
    helm_release.argo
  ]

  values = [
    file("${var.argocd_apps_values_file_path}")
  ]
}


# private key for argo repository
data "google_secret_manager_secret_version" "private-key" {
  secret = var.ssh_private_key_secret_name
}
