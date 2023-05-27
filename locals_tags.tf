locals {
  tags = {
    environment = var.environment_name
    department  = "${var.environment_name}-${var.department}"
    source      = var.deployment_source
  }
}