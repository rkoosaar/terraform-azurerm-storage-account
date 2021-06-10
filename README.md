# terraform-azurerm-storage-account

Terraform module for creating and managing Azure Storage Account resources

[![License](https://img.shields.io/badge/License-MIT-blue.svg)](LICENSE)
[![Latest Release](https://img.shields.io/github/v/release/rkoosaar/terraform-azurerm-storage-account?cacheSeconds=36)](https://github.com/rkoosaar/terraform-azurerm-storage-account/releases/latest)
[![TF Registry](https://img.shields.io/badge/terraform-registry-blue.svg)](https://registry.terraform.io/modules/rkoosaar/storage-account/azurerm)

## Examples

```
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

  # Storage Acoount Network Rules
  
  # default net rules action is set to Deny in variables 
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
```
<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
| --- | --- |
| terraform | >= 1.0.0 |

## Providers

| Name | Version |
| --- | --- |
| azurerm | >= 2.62.1 |

## Inputs


### Resource Group Variables

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| create\_az\_rg | Boolean flag which if set to true creates a resource group. Defaults to false | `bool` | no  |
| az\_rg\_name | The Name of the Resource Group | `string` | yes |
| az\_rg\_location | The Azure Region where the Resource Group should exist | `string` | yes |

### Storage Account Variables

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| az\_sa\_name | The Name of the Storage Account | `string` | yes |
| az\_sa\_account_kind | Defines the Kind of account. Valid options are BlobStorage, BlockBlobStorage, FileStorage, Storage and StorageV2, Defaults to StorageV2 | `string` | no  |
| az\_sa\_account_tier | Defines the Tier to use for this storage account. Valid options are Standard and Premium. For BlockBlobStorage and FileStorage accounts only Premium is valid | `string` | yes |
| az\_sa\_account\_replication\_type | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS | `string` | yes |
| az\_sa\_access_tier | Defines the access tier for BlobStorage, FileStorage and StorageV2 accounts. Valid options are Hot and Cool, defaults to Hot | `string` | no  |
| az\_sa\_enable\_https\_traffic_only | Boolean flag which forces HTTPS if enabled, see here for more information. Defaults to true | `bool` | no  |
| az\_sa\_min\_tls\_version | The minimum supported TLS version for the storage account. Possible values are TLS1\_0, TLS1\_1, and TLS1\_2. Defaults to TLS1\_2 (contrary to AZ default option) | `string` | no  |
| az_tags | A mapping of tags which should be assigned to all resources | `map` | no  |
| az\_sa\_net\_rules\_default_action | Specifies the default action of allow or deny when no other rules match. Valid options are Deny or Allow. Defaults to Deny | `string` | no  |
| az\_sa\_net\_rules\_ip_rules | List of public IP or IP ranges in CIDR Format. Only IPV4 addresses are allowed. Private IP address ranges (as defined in RFC 1918) are not allowed | `string list` | no  |
| az\_sa\_net\_rules\_virtual\_network\_subnet_ids | A list of virtual network subnet ids to to secure the storage account | `string list` | no  |
| az\_sa\_net\_rules\_bypass | Specifies whether traffic is bypassed for Logging/Metrics/AzureServices. Valid options are any combination of Logging, Metrics, AzureServices, or None | `string list` | no  |
| az\_sa\_account\_replication\_type | Defines the type of replication to use for this storage account. Valid options are LRS, GRS, RAGRS, ZRS, GZRS and RAGZRS | `string` | yes |

### Storage Container Variables

| Name | Description | Type | Required |
| --- | --- | --- | --- |
| az\_sc\_names | A list of containers to be created | `string list` | no  |

## Outputs

| Name | Description |
| --- | --- |
| az-sa-id | Resource azurerm_storage_account id |

<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->

## Help

**Got a question?**

File a GitHub [issue](https://github.com/rkoosaar/terraform-azurerm-storage-account/issues).

## Contributing

### Bug Reports & Feature Requests

Please use the [issue tracker](https://github.com/rkoosaar/terraform-azurerm-storage-account/issues) to report any bugs or file feature requests.

## Copyrights

Copyright © 2021 Raiko Koosaar

### Contributors

[![Raiko Koosaar][rkoosaar_avatar]][rkoosaar_homepage]<br/>[Raiko Koosaar][rkoosaar_homepage]

[rkoosaar_homepage]: https://github.com/rkoosaar
[rkoosaar_avatar]: https://github.com/rkoosaar.png?size=150
[github]: https://github.com/rkoosaar
[share_email]: mailto:?subject=terraform-azurerm-storage-account&body=https://github.com/rkoosaar/terraform-azurerm-storage-account
