# variable "cluster" {
#   description = "Minikube Cluster definition"
#   type = object({
#     name  = string
#     nodes = number
#   })

#   default = {
#     name  = "minikube-cluster"
#     nodes = 3
#   }
# }

# variable "clients" {
#   description = "Clientes do Odoo com suas configurações"
#   type = map(object({
#     replicas = number
#     image    = string
#     host     = string
#   }))
# }


# variable "odoo" {
#   description = "Odoo application definition"
#   type = object({
#     containerName = string
#     image         = string
#     ports         = list(object({
#       containerPort = number
#     }))
#   })
# }

# variable "environment" {
#   description = "Lista de ambientes para criação de recursos."
#   type        = list(string)
#   default     = ["netflix", "meta", "estrela-do-rock"]
# }

variable "cluster" {
  description = "Configuração do cluster Minikube"
  type = object({
    name = string
  })
  default = {
    name = "my-cluster"
  }
}

variable "namespace" {
  description = "Namespace para o deployment"
  type        = string
}

variable "replicas" {
  description = "Número de réplicas para o deployment"
  type        = number
  default     = 1
}

variable "domain" {
  description = "Domínio para o Ingress"
  type        = string
}

variable "tls_crt_path" {
  description = "Caminho para o certificado TLS"
  type        = string
}

variable "tls_key_path" {
  description = "Caminho para a chave privada TLS"
  type        = string
}

variable "namespaces" {
  description = "Lista de namespaces a serem criados"
  type        = list(string)
  default     = ["dev", "qa", "prod"]
}

variable "client" {
  description = "Configurações específicas de cada cliente"
  type = map(object({
    namespace   = string
    domain      = string
    tls_crt_path = string
    tls_key_path = string
  }))
  default = {
    netflix = {
      namespace   = "netflix"
      domain      = "odoo.netflix.com"
      tls_crt_path = "/path/to/netflix.crt"
      tls_key_path = "/path/to/netflix.key"
    },
    meta = {
      namespace   = "meta"
      domain      = "odoo.meta.com"
      tls_crt_path = "/path/to/meta.crt"
      tls_key_path = "/path/to/meta.key"
    },
    estrela_do_rock = {
      namespace   = "estrela_do_rock"
      domain      = "odoo.estreladorock.com"
      tls_crt_path = "/path/to/estreladorock.crt"
      tls_key_path = "/path/to/estreladorock.key"
    }
  }
}