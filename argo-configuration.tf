# key for argo gitops repository which includes application files and some charts
data "google_secret_manager_secret_version" "proftolio-private-key-gitops" {
  secret = "protolio-ssh-private-key-gitops"
}


### Repositories configuration for argo ###
resource "kubernetes_secret" "gitops_repo" {
  metadata {
    name      = "gitops-repo"
    namespace = "argo"

    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    "type"          = "git"
    "url"           = "git@github.com:elior7557/protfolio_gitops.git"
    "sshPrivateKey" = data.google_secret_manager_secret_version.proftolio-private-key-gitops.secret_data
  }
  type = "Opaque"

  depends_on = [
    module.cluster,
    helm_release.argo
  ]
}

# argocd application to start with cluster setup
resource "helm_release" "argocd-apps" {
  chart      = "argocd-apps"
  name       = "argocd-apps"
  namespace  = "argo"
  version = "0.0.8"
  repository = "https://argoproj.github.io/argo-helm"

  depends_on = [
    module.cluster,
    helm_release.argo
  ]

  values = [
    file("helm/argo_apps/applications.yaml")
  ]
}