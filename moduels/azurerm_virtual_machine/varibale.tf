variable "nic_name" {
  
}

variable "location" {
  
}

variable "resource_group_name" {
  
}

variable "secret_username" {
  
}
variable "secret_password" {
  
}

variable "key_vault_name" {
  description = "The name of the Key Vault where secrets are stored."
  type        = string
  
}

variable "vm_name" {
  description = "The name of the virtual machine."
  type        = string
}

variable "vm_size" {
  description = "The size of the virtual machine."
  type        = string
}



variable "image_publisher" {
  description = "The publisher of the image to use for the virtual machine."
  type        = string

}
variable "image_offer" {
  description = "The offer of the image to use for the virtual machine."
  type        = string
}

variable "image_sku" {
  description = "The SKU of the image to use for the virtual machine."
  type        = string
  
}
variable "image_version" {
  description = "The version of the image to use for the virtual machine."
  type        = string
}

variable "subnet_name" {
  
}

variable "virtual_network_name" {
  
}

variable "pip_name" {
  description = "The name of the public IP address to associate with the virtual machine."
  type        = string
  
}

