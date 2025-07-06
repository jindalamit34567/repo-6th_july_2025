variable "subnet_name" {
  description = "The name of the subnet."
    
  }

  variable "resource_group_name" {
    
  }

  variable "virtual_network_name" {
    
  }

  variable "address_prefixes" { 
    description = "The address prefixes for the subnet."
    type        = list(string)
  }