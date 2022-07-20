  resource "azurerm_VM" "some_erver" {
    administrator_login          = "MY_login"
    administrator_login_password = "MY_password"
    location                     ="Central_india"
    name                         = "Windows_server_2016"
    resource_group_name          = "MY_resource"
  

  backup {
    frequency = "Daily"
    time      = "04:00"
  }

  retention_daily {
    count = 30
  }
}