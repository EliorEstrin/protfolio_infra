variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
  default     = "us-central1"
}

variable "cluster_az" {
  description = "az for cluster"
  default     = "us-central1-c"
}

variable "gke_num_nodes" {
  default     = 2
  description = "number of gke nodes"
}

variable "machine_type" {
  description = "machine type for gke nodes"
  default     = "e2-medium"
}

// argo relate variable
variable "argo_logical_chart_name" {
  description = "the name of the chart"
}

variable "argo_repository" {
  description = "The URL of the Helm chart repository"
}

variable "argo_chart_name" {
  description = "The name of the Helm chart to install"
}

variable "argo_chart_version" {
  description = "The version of the Helm chart"
}

variable "argo_chart_namespace" {
  description = "The namespace of the Helm chart"
}

variable "argo_values_file_path" {
  description = "File path for the values.yaml file"
}

//argo configuration

variable "gitops_repository_name" {
  description = "the name for the repository as will be seen in the argo UI"
}

variable "gitops_repo_url" {
  description = "The URL of the GitOps repository to be used by ArgoCD."
}


variable "gitops_ssh_private_key_secret_name" {
  description = "The name of the Google Secret Manager secret that contains the SSH private key for accessing the GitOps repository."
}

// argocd apps

variable "argocd_apps_repository" {
  description = "the repository for the helm chart of argocd "
}

variable "argocd_apps_chart_version" {
  description = "The version of the ArgoCD Apps Helm chart to be installed."
}

variable "argocd_apps_values_file_path" {
  description = "The file path of the ArgoCD Apps Helm chart values.yaml file."
}


# selaed secrets 

variable "sealed_secret_namespace_name" {
  type        = string
  description = "The name of the Kubernetes namespace where the Sealed Secrets key secret should be created."
}

variable "sealed_secret_key_secret_name" {
  type        = string
  description = "The name of the Kubernetes secret used for storing the Sealed Secrets key."
}

variable "sealed_secret_tls_crt_secret" {
  type        = string
  description = "The name of the Google Secret Manager secret that contains the TLS certificate data."
}

variable "sealed_secret_tls_key_secret" {
  type        = string
  description = "The name of the Google Secret Manager secret that contains the TLS private key data."
}
