# Local Declarations

locals {
  az_rg_name     = element(coalescelist(data.azurerm_resource_group.az-rg-create.*.name, azurerm_resource_group.az-rg.*.name, [""]), 0)
  az_rg_location = element(coalescelist(data.azurerm_resource_group.az-rg-create.*.location, azurerm_resource_group.az-rg.*.location, [""]), 0)
  default_tags   = {}
  all_tags       = merge(local.default_tags, var.az_tags)
}

# Resource Group (Create or Select)

data "azurerm_resource_group" "az-rg-create" {
  count = var.create_az_rg == false ? 1 : 0
  name  = var.az_rg_name
}

resource "azurerm_resource_group" "az-rg" {
  count    = var.create_az_rg ? 1 : 0
  name     = var.az_rg_name
  location = var.az_rg_location
}

# Storage Account

resource "azurerm_storage_account" "az-sa" {
  name                = "${lower(var.az_sa_name)}${random_integer.az_sa_num.result}"
  resource_group_name = local.az_rg_name
  location            = local.az_rg_location
  account_kind        = var.az_sa_account_kind

  account_tier              = var.az_sa_account_tier
  account_replication_type  = var.az_sa_account_replication_type
  access_tier               = var.az_sa_access_tier
  enable_https_traffic_only = var.az_sa_enable_https_traffic_only
  min_tls_version           = var.az_sa_min_tls_version

  tags = local.all_tags
}

# Creates Storage Account network rules

resource "azurerm_storage_account_network_rules" "az-sa-net-rules" {
  storage_account_name = azurerm_storage_account.az-sa.name
  resource_group_name  = local.az_rg_name

  default_action             = var.az_sa_net_rules_default_action
  ip_rules                   = var.az_sa_net_rules_ip_rules
  virtual_network_subnet_ids = var.az_sa_net_rules_virtual_network_subnet_ids
  bypass                     = var.az_sa_net_rules_bypass

}

# Used to generate a part of the storage name

resource "random_integer" "az_sa_num" {
  min = 1000
  max = 9999
}

# Call the module to deploy any required containers

module "storage-container" {
  source = "./modules/storage-container/"

  az_sc_names = var.az_sc_names
  az_sa_name  = azurerm_storage_account.az-sa.name

  depends_on = [azurerm_storage_account.az-sa]
}