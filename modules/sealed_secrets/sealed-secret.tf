# Namespace for sealed-secrets
resource "kubernetes_namespace" "sealed-secrets-ns" {
  metadata {
    name = var.namespace_name
  }
}

# Sealed secrets keys
resource "kubernetes_secret" "sealed-secrets-key" {
  metadata {
    name      = var.secret_name
    namespace = var.namespace_name
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
  secret = var.tls_crt_secret
}

data "google_secret_manager_secret_version" "tls-key" {
  secret = var.tls_key_secret
}

