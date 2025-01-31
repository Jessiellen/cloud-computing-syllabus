resource "kubernetes_deployment" "postgres" {
  for_each = var.client

  metadata {
    name      = "postgres"
    namespace = each.value.namespace
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "postgres"
      }
    }
    template {
      metadata {
        labels = {
          app = "postgres"
        }
      }
      spec {
        container {
          name  = "postgres"
          image = "postgres:latest"
          port {
            container_port = 5432
          }
          env {
            name  = "POSTGRES_DB"
            value = "odoo"
          }
          env {
            name  = "POSTGRES_USER"
            value = "odoo"
          }
          env {
            name  = "POSTGRES_PASSWORD"
            value = "odoo"
          }
        }
      }
    }
  }
}

resource "kubernetes_service" "postgres" {
  for_each = var.client

  metadata {
    name      = "postgres"
    namespace = each.value.namespace
  }

  spec {
    selector = {
      app = "postgres"
    }
    port {
      port        = 5432
      target_port = 5432
    }
    type = "ClusterIP"
  }
}
