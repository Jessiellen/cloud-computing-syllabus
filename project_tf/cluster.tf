resource "minikube_cluster" "my_cluster" {
    cluster_name = "project-cluster"
    driver = "docker"
    nodes = 2
    addons = [
    "dashboard",
    "default-storageclass",
    "ingress",
    "storage-provisioner"
  ]
}