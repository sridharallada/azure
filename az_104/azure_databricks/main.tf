terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
    databricks = {
      source  = "databrickslabs/databricks"
      version = "0.3.0"
    }
  }
}

# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}


# # Create a resource group
# resource "azurerm_resource_group" "resource_group" {
#   name     = "example-resources"
#   location = "West Europe"
# }