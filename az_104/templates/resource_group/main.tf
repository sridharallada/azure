terraform {
  required_version = ">= 0.15"
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=2.58.0"
    }
  }
}
provider "azurerm" {
  features {}
}
module "resource_group" {
  source  = "../../local_modules/resource_group"
  resource_groups = var.resource_groups
  global_tags     = var.global_tags
}