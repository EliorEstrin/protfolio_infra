# Argo helm chart
resource "helm_release" "argo" {
  name = var.chart_logical_name

  repository       = var.repository
  chart            = var.chart_name
  version          = var.chart_version
  namespace        = var.chart_namespace
  create_namespace = true

  values = [
    file("${var.values_file_path}")
  ]
}

