output "namespaces" {
  description = "Namespaces criados para cada cliente"
  value       = { for client, ns in kubernetes_namespace.client_namespace : client => ns.metadata[0].name }
}

output "postgres_services" {
  description = "Endereços  do PostgreSQL para cada cliente"
  value       = { for client, svc in kubernetes_service.postgres : client => svc.spec[0].cluster_ip }
}

output "odoo_services" {
  description = "Endereços do Odoo para cada cliente"
  value       = { for client, svc in kubernetes_service.odoo : client => svc.spec[0].cluster_ip }
}

output "ingress_hosts" {
  description = "Hosts configurados nos Ingress para cada cliente"
  value       = { for client, ingress in kubernetes_ingress_v1.odoo_ingress : client => ingress.spec[0].rule[0].host }
}

output "tls_secrets" {
  description = "Nomes dos segredos TLS criados para cada cliente"
  value       = { for client, secret in kubernetes_secret.tls : client => secret.metadata[0].name }
}