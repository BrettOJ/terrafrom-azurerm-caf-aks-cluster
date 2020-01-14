# merge tags with lower level tags
locals {
  module_tag          = {
    "module" = basename(abspath(path.module))
  }
  tags                = merge(var.tags,local.module_tag)
  resource_group      = lookup(module.azurerm_resource_group.names, "SPOKE-RG-AKS", null)
}
#retrieve the version of Kubernetes supported by Azure Kubernetes Service.
data "azurerm_kubernetes_service_versions" "current" {
  location = var.location
}

locals {
  random = random_integer.random.result
}

resource "random_integer" "random" {
  min = 100
  max = 999
}