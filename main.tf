module "cluster" {
  source        = "./modules/cluster"
  project_id    = var.project_id
  region        = var.region
  cluster_az    = var.cluster_az
  gke_num_nodes = var.gke_num_nodes
  machine_type  = var.machine_type
}