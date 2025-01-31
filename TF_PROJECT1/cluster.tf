resource "minikube_cluster" "my_cluster" {
  cluster_name = "my-minikube-cluster"
  nodes        = 3
  addons = [
    "dashboard",
    "default-storageclass",
    "ingress",
    "storage-provisioner"
  ]
}

output "minikube_cluster_info" {
  value     = minikube_cluster.my_cluster
  sensitive = true
}