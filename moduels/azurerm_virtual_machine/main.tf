

resource "azurerm_network_interface" "nic" {
  name                = var.nic_name
  location            = var.location
  resource_group_name = var.resource_group_name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = data.azurerm_subnet.frontend_subnet.id # Reference to the subnet data source
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id = data.azurerm_public_ip.pip.id # Reference to the public IP address resource
  }
}



resource "azurerm_linux_virtual_machine" "myvm" {
  name                = var.vm_name
  resource_group_name = var.resource_group_name
  location            = var.location
  size                = var.vm_size
  admin_username      = data.azurerm_key_vault_secret.vm_username.value
  admin_password      = data.azurerm_key_vault_secret.vm_password.value # Use the password from Key Vault
  disable_password_authentication = false
   # Reference to the Key Vault where secrets are stored
   # Reference to the Key Vault where secrets are stored
  # Use a secure password in production
  network_interface_ids = [
    azurerm_network_interface.nic.id,
  ]
 # How to use admin password instead of ssh key - Homework  # 
  #   admin_ssh_key {
  #   username   = "adminuser"
  #   public_key = file("~/.ssh/id_rsa.pub")
  # }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = var.image_publisher #Publisher from Azure Marketplace
    offer     = var.image_offer  # offer from Azure Marketplace
    sku       = var.image_sku # Plan id from Azure Marketplace
    version   = var.image_version # Version of the image
  }

  custom_data = base64encode(<<-EOF
#!/bin/bash
apt-get update
apt-get install -y nginx
systemctl enable nginx
systemctl start nginx
EOF 
)
}