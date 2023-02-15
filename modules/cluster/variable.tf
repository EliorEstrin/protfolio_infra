################### Gke cluster Variables ####################
variable "project_id" {
  description = "project id"
}

variable "region" {
  description = "region"
}

variable "cluster_az" {
  description = "az for cluster"
}

variable "gke_num_nodes" {
  description = "number of gke nodes"
}

variable "machine_type" {
  description = "machine type for gke nodes"
}

variable "cluster_disk_size_gb" {
  description = "cluster disk size"
}

#####################  Vpc Values ##########################
variable "cluster_subnet" {
  description = "google_compute_subnetwork"
}