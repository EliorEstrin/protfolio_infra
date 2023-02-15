variable "namespace_name" {
  type        = string
  description = "The name of the Kubernetes namespace where the Sealed Secrets key secret should be created."
}

variable "secret_name" {
  type        = string
  description = "The name of the Kubernetes secret used for storing the Sealed Secrets key."
}

variable "tls_crt_secret" {
  type        = string
  description = "The name of the Google Secret Manager secret that contains the TLS certificate data."

}

variable "tls_key_secret" {
  type        = string
  description = "The name of the Google Secret Manager secret that contains the TLS private key data."
}
