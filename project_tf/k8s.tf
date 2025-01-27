resource "kubernetes_namespace" "dev" {
  metadata {
    name = "dev"
  }
}

resource "kubernetes_namespace" "qa" {
  metadata {
    name = "qa"
  }
}

resource "kubernetes_namespace" "prod" {
  metadata {
    name = "prod"
  }
}

resource "kubernetes_deployment" "nginx_dev" {
  depends_on = [kubernetes_namespace.dev]
  
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.dev.metadata[0].name
  }

  spec {
    replicas = 1
    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "nginx_qa" {
  depends_on = [kubernetes_namespace.qa]
  
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.qa.metadata[0].name
  }

  spec {
    replicas = 2
    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}

resource "kubernetes_deployment" "nginx_prod" {
  depends_on = [kubernetes_namespace.prod]
  
  metadata {
    name      = "nginx"
    namespace = kubernetes_namespace.prod.metadata[0].name
  }

  spec {
    replicas = 3
    selector {
      match_labels = {
        app = "nginx"
      }
    }

    template {
      metadata {
        labels = {
          app = "nginx"
        }
      }

      spec {
        container {
          name  = "nginx"
          image = "nginx:latest"
          port {
            container_port = 80
          }
        }
      }
    }
  }
}
