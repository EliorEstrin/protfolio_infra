# Sealed Secrets Installation with argo cd initiallzation 

# Namespace for sealed-secrets
resource "kubernetes_namespace" "sealed-secrets-ns" {
  metadata {
    name = "sealed-secrets"
  }
  depends_on = [
    module.cluster
  ]
}

# Sealed secrets keys
resource "kubernetes_secret" "sealed-secrets-key" {
  metadata {
    name      = "sealed-secrets-key"
    namespace = "sealed-secrets"
  }
  data = {
    "tls.crt" = data.google_secret_manager_secret_version.tls-crt.secret_data
    "tls.key" = data.google_secret_manager_secret_version.tls-key.secret_data
  }
  type       = "kubernetes.io/tls"
  depends_on = [kubernetes_namespace.sealed-secrets-ns]
}

# Helm chart for sealed secrets
resource "helm_release" "sealed-secrets" {
  chart      = "sealed-secrets"
  name       = "sealed-secrets"
  repository = "https://bitnami-labs.github.io/sealed-secrets"
  version    = "2.7.3"

  # namespace = "sealed-secrets"

  depends_on = [
    module.cluster,
    kubernetes_namespace.sealed-secrets-ns,
    kubernetes_secret.sealed-secrets-key
  ]
}


# secrets for sealed secret
data "google_secret_manager_secret_version" "tls-crt" {
  secret = "bitnami-tls-crt"
}

data "google_secret_manager_secret_version" "tls-key" {
  secret = "bitnami-tls-key"
}

# key for argo repository configuration
data "google_secret_manager_secret_version" "proftolio-private-key" {
  secret = "protolio-ssh-private-key"
}



## Repositore configuration for argo

// Private repository credentials
resource "kubernetes_secret" "chart_repo" {
  metadata {
    name      = "chart-repo"
    namespace = "argo"

    labels = {
      "argocd.argoproj.io/secret-type" = "repository"
    }
  }

  data = {
    "type"          = "git"
    "url"           = "git@github.com:elior7557/protfolio_charts.git"
    "sshPrivateKey" = data.google_secret_manager_secret_version.proftolio-private-key.secret_data
  }
  type = "Opaque"

  depends_on = [
    module.cluster,
    helm_release.argo
  ]
}
