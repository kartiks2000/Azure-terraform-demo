resource "azurerm_resource_group" "example" {
	name     = "1-b6a0b209-playground-sandbox"
	location = "East US"
}

resource "azurerm_network_security_group" "example" {
  name                = "example-security-group"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name

  security_rule {
    name                       = "Allow tcp"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }
}

resource "azurerm_virtual_network" "example" {
  name                = "example-network"
  location            = azurerm_resource_group.example.location
  resource_group_name = azurerm_resource_group.example.name
  address_space       = ["10.0.0.0/16"]
  dns_servers         = ["10.0.0.4", "10.0.0.5"]

  subnet {
    name           = "Public-subnet"
    address_prefix = "10.0.1.0/24"
  }

  subnet {
    name           = "Private-subnet"
    address_prefix = "10.0.2.0/24"
    security_group = azurerm_network_security_group.example.id
  }

  tags = {
    environment = "Production"
  }
}
