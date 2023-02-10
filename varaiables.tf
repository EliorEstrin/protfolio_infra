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