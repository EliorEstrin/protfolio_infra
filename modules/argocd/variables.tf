variable "chart_logical_name" {
  description = "the name of the chart"
}

variable "repository" {
  description = "The URL of the Helm chart repository"
}

variable "chart_name" {
  description = "The name of the Helm chart to install"
}

variable "chart_version" {
  description = "The version of the Helm chart"
}

variable "chart_namespace" {
  description = "The namespace of the Helm chart"
}

variable "values_file_path" {
  description = "File path for the values.yaml file"
  type        = string
}

// Variables for argo configuration

variable "repository_name" {
  description = "the name for the repository as will be seen in the argo UI"
}

variable "repo_url" {
  description = "The URL of the GitOps repository to be used by ArgoCD."
}


variable "ssh_private_key_secret_name" {
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
