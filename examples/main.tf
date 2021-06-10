module "az-storage-account" {
  source = "../modules/terraform-azurerm-storage-account"

  # Resource Group Variables

  #create_az_rg   = false
  az_rg_name     = "ResourceGroup-Name"
  az_rg_location = "UK South"

  # Storage Account Variables

  az_sa_name = "tfstorage"
  az_sa_account_tier             = "Standard"
  az_sa_account_replication_type = "LRS"

  # Storage Account Network Rules
  # Default action is Deny 
  az_sa_net_rules_default_action = "Allow"
  az_sa_net_rules_bypass   = ["AzureServices"]

  # Storage Container Variables

  az_sc_names = ["dev", "mgmt", "stg", "prd"]

  # use this if you are creating a resource group first using RG module
  #depends_on = [module.az-resource-group]

  az_tags = {
    Environment   = "Development"
    CostCenter    = "Department"
    ResourceOwner = "Example Owner"
    Project       = "Project Name"
    Role          = "Resource Group"
  }
}