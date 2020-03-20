resource "azurerm_resource_group" "rg" {
  name     = "${var.prefix}-resources"
  location = var.location
  tags = {
    environment = "Development"
  }
}

resource "azurerm_virtual_network" "vn" {
  name                = "${var.prefix}-network"
  address_space       = var.virtual_network_address_space
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name
  tags = {
    environment = "Development"
  }
}

resource "azurerm_subnet" "subnet" {
  name                 = "${var.prefix}-subnet"
  resource_group_name  = azurerm_resource_group.rg.name
  virtual_network_name = azurerm_virtual_network.vn.name
  address_prefix       = var.subnet_address_prefix
}

resource "azurerm_public_ip" "pip" {
  name                    = "${var.prefix}-test-pip"
  location                = azurerm_resource_group.rg.location
  resource_group_name     = azurerm_resource_group.rg.name
  allocation_method       = "Dynamic"
  idle_timeout_in_minutes = 30
  tags = {
    environment = "Development"
  }
}

resource "azurerm_network_interface" "nic" {
  name                = "${var.prefix}-nic"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  ip_configuration {
    name                          = "${var.prefix}-conf"
    subnet_id                     = azurerm_subnet.subnet.id
    private_ip_address_allocation = var.private_ip_address_allocation
    public_ip_address_id          = azurerm_public_ip.pip.id
  }
  tags = {
    environment = "Development"
  }
}

resource "azurerm_network_security_group" "nsg" {
  name                = "${var.prefix}-nsg"
  location            = azurerm_resource_group.rg.location
  resource_group_name = azurerm_resource_group.rg.name

  security_rule {
    name                       = "nsg1-ssh"
    priority                   = 100
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "22"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "nsg2-http"
    priority                   = 101
    direction                  = "Inbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "*"
    destination_port_range     = "80"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  security_rule {
    name                       = "outbound-https"
    priority                   = 100
    direction                  = "Outbound"
    access                     = "Allow"
    protocol                   = "Tcp"
    source_port_range          = "443"
    destination_port_range     = "*"
    source_address_prefix      = "*"
    destination_address_prefix = "*"
  }

  tags = {
    environment = "Development"
  }
}

resource "azurerm_virtual_machine" "vm" {
  name                  = "${var.prefix}-vm"
  location              = azurerm_resource_group.rg.location
  resource_group_name   = azurerm_resource_group.rg.name
  network_interface_ids = [azurerm_network_interface.nic.id]
  vm_size               = var.vm_size

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  # delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  # delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = var.os_image_publisher
    offer     = var.os_image_offer
    sku       = var.os_image_sku
    version   = var.os_image_version
  }
  storage_os_disk {
    name              = "${var.prefix}-myosdisk1"
    caching           = var.os_disk_caching
    create_option     = var.os_disk_create_option
    managed_disk_type = var.os_disk_managed_disk_type
  }
  os_profile {
    computer_name  = "${var.prefix}hostname"
    admin_username = var.os_admin_username
  }
  os_profile_linux_config {
    disable_password_authentication = var.disable_password_authentication
    ssh_keys {
      path     = "/home/${var.os_admin_username}/.ssh/authorized_keys"
      key_data = var.key_data
    }
  } 
  tags = {
    environment = "Development"
  }
}

resource "azurerm_storage_account" "bootcampstg" {
  name                     = "${var.prefix}${var.stgsuffix}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = var.storage_account_tier
  account_kind             = var.storage_account_kind
  account_replication_type = var.storage_account_replication_type
}

resource "azurerm_storage_container" "bootcampstgcon" {
  name                  = "${var.prefix}stgcon"
  storage_account_name  = azurerm_storage_account.bootcampstg.name
  container_access_type = var.container_access_type
}

resource "azurerm_storage_blob" "install_nginx" {
  name                   = "${var.prefix}-installnginx.sh"
  storage_account_name   = azurerm_storage_account.bootcampstg.name
  storage_container_name = azurerm_storage_container.bootcampstgcon.name
  type                   = var.storage_blob_type
  source                 = var.storage_blob_source
}

resource "azurerm_virtual_machine_extension" "install-nginx" {
  name                 = "${var.prefix}-extension"
  virtual_machine_id   = azurerm_virtual_machine.vm.id
  publisher            = "Microsoft.Azure.Extensions"
  type                 = "CustomScript"
  type_handler_version = "2.0"

  settings = <<SETTINGS
    {
        "fileUris": ["https://${var.prefix}${var.stgsuffix}.blob.core.windows.net/bootcampstgcon/bootcamp-installnginx.sh"],
        "commandToExecute": "sh bootcamp-installnginx.sh"
    }
SETTINGS


  tags = {
    environment = "Development"
  }
  depends_on = [
    azurerm_storage_blob.install_nginx,
  ]
}
