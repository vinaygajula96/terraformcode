#creating a resource group
resource "azurerm_resource_group" "this" {
  location = var.location
  name     = "${var.name}-Group"
}
output "tempout" {
  value = azurerm_resource_group.this.name
}
resource "azurerm_resource_group" "demo" {
  location = var.location
  name     = "${var.name}-Group"
}
# Create virtual network
resource "azurerm_virtual_network" "this" {
  name = var.name
  // name                = var.vnetname
  address_space       = [var.network_address]
  location            = azurerm_resource_group.this.location
  resource_group_name = azurerm_resource_group.this.name
}
# Create subnets
resource "azurerm_subnet" "public-1" {
  name = "${var.name}-public-subnet-1"
  //name                 = var.subnet_1_name
  //resource_group_name  = azurerm_resource_group.this.name
  //virtual_network_name = azurerm_virtual_network.this.name
  resource_group_name  = "${var.name}-Group"
  virtual_network_name = var.name
  address_prefixes     = [cidrsubnet(var.network_address, 8, 1)]
}
resource "azurerm_subnet" "public-2" {
  name = "${var.name}-public-subnet-2"
  //name                 = var.subnet_2_name
  resource_group_name  = azurerm_resource_group.this.name
  virtual_network_name = azurerm_virtual_network.this.name
  address_prefixes     = [cidrsubnet(var.network_address, 8, 10)]
}
