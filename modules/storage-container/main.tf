# Storage container

resource "azurerm_storage_container" "az-sc" {
  # Loops through each of the container names
  for_each = toset(var.az_sc_names)

  name                  = each.key
  storage_account_name  = var.az_sa_name
  container_access_type = var.az_sa_container_access_type
}