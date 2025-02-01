variable "clients" {
  description = "Lista de clientes"
  type        = list(string)
  default     = ["netflix", "meta", "estrela-do-rock"]
}

variable "environments" {
  description = "Lista de ambientes"
  type        = list(string)
  default     = ["dev", "qa", "prod"]
}