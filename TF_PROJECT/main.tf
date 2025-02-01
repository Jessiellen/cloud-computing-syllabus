resource "kubernetes_namespace" "client_namespace" {
  for_each = toset(var.clients)

  metadata {
    name = each.value
  }
}

resource "kubernetes_deployment" "postgres" {
  for_each = toset(var.clients)

  metadata {
    name      = "postgres-${each.value}"
    namespace = kubernetes_namespace.client_namespace[each.value].metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "postgres-${each.value}"
      }
    }

    template {
      metadata {
        labels = {
          app = "postgres-${each.value}"
        }
      }

      spec {
        container {
          name  = "postgres"
          image = "postgres:13"

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

          port {
            container_port = 5432
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "odoo" {
  for_each = toset(var.clients)

  metadata {
    name      = "odoo-${each.value}"
    namespace = kubernetes_namespace.client_namespace[each.value].metadata[0].name
  }

  spec {
    replicas = 1

    selector {
      match_labels = {
        app = "odoo-${each.value}"
      }
    }

    template {
      metadata {
        labels = {
          app = "odoo-${each.value}"
        }
      }

      spec {
        container {
          name  = "odoo"
          image = "odoo:14.0"

          env {
            name  = "ODOO_DATABASE_HOST"
            value = "postgres-${each.value}"  
          }

          env {
            name  = "ODOO_ADMIN_PASSWORD"
            value = "admin"
          }

          port {
            container_port = 8069
          }
        }
      }
    }
  }
}


resource "kubernetes_service" "odoo" {
  for_each = toset(var.clients)

  metadata {
    name      = "odoo-${each.value}"
    namespace = kubernetes_namespace.client_namespace[each.value].metadata[0].name
  }

  spec {
    selector = {
      app = "odoo-${each.value}"
    }

    port {
      port        = 8069
      target_port = 8069
    }

    type = "ClusterIP"
  }
}

resource "kubernetes_ingress_v1" "odoo_ingress" {
  for_each = toset(var.clients)

  metadata {
    name      = "odoo-ingress-${each.value}"
    namespace = kubernetes_namespace.client_namespace[each.value].metadata[0].name
    annotations = {
      "nginx.ingress.kubernetes.io/ssl-redirect" = "true"
    }
  }

  spec {
    tls {
      hosts       = ["${each.value}.example.com"]
      secret_name = "odoo-tls-${each.value}"
    }

    rule {
      host = "${each.value}.example.com"
      http {
        path {
          path = "/"
          backend {
            service {
              name = "odoo-${each.value}"
              port {
                number = 8069
              }
            }
          }
        }
      }
    }
  }
}

resource "kubernetes_secret" "tls" {
  for_each = toset(var.clients)

  metadata {
    name      = "odoo-tls-${each.value}"
    namespace = kubernetes_namespace.client_namespace[each.value].metadata[0].name
  }

  data = {
    "tls.crt" = filebase64("tls/certs/${each.value}-tls.crt")
    "tls.key" = filebase64("tls/certs/${each.value}-tls.key")
  }

  type = "kubernetes.io/tls"
}

resource "kubernetes_service" "postgres" {
  for_each = toset(var.clients)

  metadata {
    name      = "postgres-${each.value}"
    namespace = kubernetes_namespace.client_namespace[each.value].metadata[0].name
  }

  spec {
    selector = {
      app = "postgres-${each.value}"
    }

    port {
      port        = 5432
      target_port = 5432
    }

    type = "ClusterIP"
  }
}