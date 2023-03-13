variable "azure_service_principal_display_name" {
  description = "A display name for the Azure Active Directory (Azure AD) service principal."
  type        = string
}

terraform {
  required_providers {
    azuread = {
      source  = "hashicorp/azuread"
    }
  }
}

provider "azurerm" {
  features {}
}

resource "azuread_application" "this" {
  display_name = var.azure_service_principal_display_name
}

resource "azuread_service_principal" "this" {
  application_id = azuread_application.this.application_id
}

resource "time_rotating" "month" {
  rotation_days = 30
}

resource "azuread_service_principal_password" "this" {
  service_principal_id = azuread_service_principal.this.object_id
  rotate_when_changed  = { rotation = time_rotating.month.id }
}

output "azure_client_id" {
  description = "The Azure AD service princpal's application (client) ID."
  value       = azuread_application.this.application_id
}

output "azure_client_secret" {
  description = "The Azure AD service principal's client secret value."
  value       = azuread_service_principal_password.this.value
  sensitive   = true
}