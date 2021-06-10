# Resource Group Variables

variable "create_az_rg" {
  description = "Boolean flag which if set to true creates a resource group. Defaults to false"
  type        = bool
  default     = false
}

variable "az_rg_name" {
  description = "The Name of the Resource Group"
  type        = string
}

variable "az_rg_location" {
  description = "The Azure Region where the Resource Group should exist"
  type        = string
}

# Storage Account Variables

variable "az_sa_name" {
  description = "The Name of the Storage Account"
  type        = string
}

variable "az_sa_account_kind" {
  description = "Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2, Defaults to StorageV2"
  type        = string
  default     = null
}

variable "az_sa_account_tier" {
  description = "Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid"
  type        = string
}

variable "az_sa_account_replication_type" {
  description = "Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS"
  type        = string
}

variable "az_sa_access_tier" {
  description = "Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot"
  type        = string
  default     = null
}

variable "az_sa_enable_https_traffic_only" {
  description = "Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true"
  type        = bool
  default     = true
}
variable "az_sa_min_tls_version" {
  description = "The minimum supported TLS version for the storage account. Possible values are TLS1_0, TLS1_1, and TLS1_2. Defaults to TLS1_2 (contrary to AZ default option)"
  type        = string
  default     = "TLS1_2"
}

variable "az_tags" {
  description = "A mapping of tags which should be assigned to all resources"
  type        = map(any)
  default     = {}
}

variable "az_sa_net_rules_default_action" {
  description = "Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow"
  type        = string
  default     = "Deny"
}

variable "az_sa_net_rules_ip_rules" {
  description = "List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed"
  type        = list(string)
  default     = null
}

variable "az_sa_net_rules_virtual_network_subnet_ids" {
  description = "A list of virtual network subnet ids to to secure the storage account"
  type        = list(string)
  default     = null
}

variable "az_sa_net_rules_bypass" {
  description = "Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None"
  type        = list(string)
  default     = null
}

# Storage Container Variables

variable "az_sc_names" {
  description = "A list of containers to be created"
  type        = list(string)
  default     = []
}