resource "azurerm_resource_group" "rg_demo" {
  name     = "rg_demo"
  location = "West Europe"
}

resource "azurerm_storage_account" "storage_demo" {
  name                     = "storagedemosridhar123"
  resource_group_name      = azurerm_resource_group.rg_demo.name
  location                 = azurerm_resource_group.rg_demo.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  tags = {
    environment = "staging"
  }
}

resource "azurerm_storage_container" "storage_container" {
  name                  = "sridharcontainer"
  storage_account_name  = azurerm_storage_account.storage_demo.name
  container_access_type = "private"
}