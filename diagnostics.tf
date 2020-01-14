
module "diagnostics_aks_cluster" {
  source  = "aztfmod/caf-diagnostics/azurerm"
  version = "1.0.0"

  name                            = azurerm_kubernetes_cluster.aks.name
  resource_id                     = azurerm_kubernetes_cluster.aks.id
  log_analytics_workspace_id      = var.log_analytics_workspace_id
  diagnostics_map                 = var.diagnostics_map
  diag_object                     = var.diag_object

}