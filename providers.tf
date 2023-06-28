terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}

provider "azurerm" {
  features {}

  skip_provider_registration = "true"
#   subscription_id   = "2213e8b1-dbc7-4d54-8aff-b5e315df5e5b"
#   tenant_id         = "84f1e4ea-8554-43e1-8709-f0b8589ea118"
#   client_id         = "4490534c-78c0-4714-a3a4-acc3611e4925"
#   client_secret     = "DRx8Q~qGhZcX8bzabyuePkT8Ni0Q4qx7XVgtSa.E"
}