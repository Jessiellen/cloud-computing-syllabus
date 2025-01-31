terraform {
  required_providers {
    kubernetes = {
      source  = "hashicorp/kubernetes"
      version = "2.23.0" 
    }
    minikube = {
      source  = "scott-the-programmer/minikube"
      version = "0.3.0" 
    }
    tls = {
      source  = "hashicorp/tls"
      version = "4.0.6" 
    }
  }
}

provider "minikube" {
  # Configuration options
}

provider "kubernetes" {
  # Configuration options
  host = minikube_cluster.my_cluster.host
  cluster_ca_certificate = minikube_cluster.my_cluster.cluster_ca_certificate
  client_certificate = minikube_cluster.my_cluster.client_certificate
  client_key = minikube_cluster.my_cluster.client_key
}

