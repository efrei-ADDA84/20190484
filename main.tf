# Configure the Microsoft Azure Provider
provider "azurerm" {
  features {}
}
data "azurerm_resource_group" "group_m" {
  name     = "ADDA84-CTP"
}


data "azurerm_virtual_network" "virtual_network" {
  name                = "network-tp4"
  resource_group_name = data.azurerm_resource_group.group_m.name
}
data "azurerm_subnet" "subnet" {
  name                 = "internal"
  resource_group_name  = data.azurerm_resource_group.group_m.name
  virtual_network_name = data.azurerm_virtual_network.virtual_network.name
}
resource "azurerm_public_ip" "public-ip-Mel" {
  name                = "public-ip-Melina"
  location            = "francecentral"
  resource_group_name = "ADDA84-CTP"
  allocation_method   = "Dynamic"
}
resource "azurerm_network_interface" "interface-M" {
  name                      = "interface-Melina"
  location                  = "francecentral"
  resource_group_name       = "ADDA84-CTP"

  ip_configuration {
    name                          = "ip_config-Melina"
    subnet_id                     = "/subscriptions/765266c6-9a23-4638-af32-dd1e32613047/resourceGroups/ADDA84-CTP/providers/Microsoft.Network/virtualNetworks/network-tp4/subnets/internal"
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.public-ip-Mel.id
  }
}

resource "azurerm_linux_virtual_machine" "VM-Melina" {
  name                  = "devops-20190484"
  location              = "francecentral"
  resource_group_name   = "ADDA84-CTP"
  size                = "Standard_D2s_v3"
  network_interface_ids = [azurerm_network_interface.interface-M.id]
  admin_username      = "devops"


  os_disk {
    name          = "os-disk-Melina"
    caching       = "ReadWrite"
    storage_account_type = "Standard_LRS"

  }
  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
  admin_ssh_key {
    username       = "devops"
    public_key     = tls_private_key.tls_private_key_M.public_key_openssh

  }

}

resource "tls_private_key" "tls_private_key_M" {
  algorithm = "RSA"
  rsa_bits  = 4096
}

output "public_key" {
  value = tls_private_key.tls_private_key_M.public_key_openssh
}

output "private_key" {
  value     = tls_private_key.tls_private_key_M.private_key_pem
  sensitive = true
}
