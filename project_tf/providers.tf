terraform {
  required_providers {
    minikube = {
      source = "scott-the-programmer/minikube"
      version = "0.4.4"
    }
    kubernetes = {
      source = "hashicorp/kubernetes"
      version = "2.35.1"
    }
  }
}

provider "minikube" {
  # Configuration options
}

provider "kubernetes" {
  host                   = minikube_cluster.my_cluster.host
  cluster_ca_certificate = minikube_cluster.my_cluster.cluster_ca_certificate
  client_certificate     = minikube_cluster.my_cluster.client_certificate
  client_key             = minikube_cluster.my_cluster.client_key
}

variable "namespace" {
  type = list(string)
  description = "kubernetes namesoaces"
}

resource "minikube_cluster" "cluster" {
  cluster_name = "project_tf"
  nodes = 1
}

resource "kubernetes_namespace" "environment" {
  for_each = toset(var.namespace)
  metadata {
    name = each.key
  }
}

resource "kubernetes_de" "name" {
  
}