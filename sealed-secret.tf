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

# secrets for sealed secret
data "google_secret_manager_secret_version" "tls-crt" {
  secret = "bitnami-tls-crt"
}

data "google_secret_manager_secret_version" "tls-key" {
  secret = "bitnami-tls-key"
}
