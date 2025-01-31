resource "kubernetes_deployment" "odoo" {
  for_each = var.client

  metadata {
    name      = "odoo"
    namespace = each.value.namespace  
  }

  spec {
    replicas = var.replicas
    selector {
      match_labels = {
        app = "odoo"
      }
    }
    template {
      metadata {
        labels = {
          app = "odoo"
        }
      }
      spec {
        container {
          name  = "odoo"
          image = "odoo:latest"
          port {
            container_port = 8069
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "odoo" {
  for_each = var.client

  metadata {
    name      = "odoo"
    namespace = each.value.namespace  
  }

  spec {
    selector = {
      app = "odoo"
    }
    port {
      port        = 80
      target_port = 8069
    }
    type = "ClusterIP"
  }
}
