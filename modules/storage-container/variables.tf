# Storage Container Variables

variable "az_sc_names" {
  description = "A list of containers to be created"
  type        = list(string)
  default     = []
}

variable "az_sa_name" {
  description = "The storage account to create the containers in"
  type        = string
}

variable "az_sa_container_access_type" {
  description = "The storage account to create the containers in"
  type        = string
  default     = "private"
}