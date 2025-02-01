<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | 2.23.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | 4.0.6 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_kubernetes"></a> [kubernetes](#provider\_kubernetes) | 2.23.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [kubernetes_deployment.odoo](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/deployment) | resource |
| [kubernetes_deployment.postgres](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/deployment) | resource |
| [kubernetes_ingress_v1.odoo_ingress](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/ingress_v1) | resource |
| [kubernetes_namespace.client_namespace](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/namespace) | resource |
| [kubernetes_secret.tls](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/secret) | resource |
| [kubernetes_service.odoo](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/service) | resource |
| [kubernetes_service.postgres](https://registry.terraform.io/providers/hashicorp/kubernetes/2.23.0/docs/resources/service) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_clients"></a> [clients](#input\_clients) | Lista de clientes | `list(string)` | <pre>[<br>  "netflix",<br>  "meta",<br>  "estrela-do-rock"<br>]</pre> | no |
| <a name="input_environments"></a> [environments](#input\_environments) | Lista de ambientes | `list(string)` | <pre>[<br>  "dev",<br>  "qa",<br>  "prod"<br>]</pre> | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_ingress_hosts"></a> [ingress\_hosts](#output\_ingress\_hosts) | Hosts configurados nos Ingress para cada cliente |
| <a name="output_namespaces"></a> [namespaces](#output\_namespaces) | Namespaces criados para cada cliente |
| <a name="output_odoo_services"></a> [odoo\_services](#output\_odoo\_services) | Endereços do Odoo para cada cliente |
| <a name="output_postgres_services"></a> [postgres\_services](#output\_postgres\_services) | Endereços  do PostgreSQL para cada cliente |
| <a name="output_tls_secrets"></a> [tls\_secrets](#output\_tls\_secrets) | Nomes dos segredos TLS criados para cada cliente |
<!-- END_TF_DOCS -->