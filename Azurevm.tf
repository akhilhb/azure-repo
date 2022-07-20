resource "azurerm_resource_group" "example" {
  name     = "tfex-recovery_vault"
  location = "West US"
}

resource "azurerm_recovery_services_vault" "example" {
  name                = "tfex-recovery-vault"
  location            = "${azurerm_resource_group.example.location}"
  resource_group_name = "${azurerm_resource_group.example.name}"
  sku                 = "Standard"
}

resource "azurerm_recovery_services_protection_policy_vm" "test" {
  name                = "tfex-recovery-vault-policy"
  resource_group_name = "${azurerm_resource_group.example.name}"
  recovery_vault_name = "${azurerm_recovery_services_vault.example.name}"

  timezone = "UTC"

  backup {
    frequency = "Daily"
    time      = "23:00"
  }

  retention_daily {
    count = 10
  }