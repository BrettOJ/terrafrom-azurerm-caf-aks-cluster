
# Creates an Azure AKS cluster

creates a aks cluster in the specified region.

Reference the module to a specific version (recommended):

```hcl
module "azurerm_kubernetes_cluster" {

    source  = "aztfmod/terrafrom-caf-aks-cluster/azurerm"
    version = "0.1.0"
  
      dns_prefix          = "aks-${var.app_name}-${var.env}-${local.random}"
      resource_group_name = var.resource_group_name
      location            = var.location
      node_resource_group = var.aks_node_rg
      admin_username = var.linux_admin_username

```

Or get the latest version

```hcl

module "azurerm_kubernetes_cluster" {

    source  = "git://github.com/aztfmod/.git?ref=latest"
      dns_prefix          = "aks-${var.app_name}-${var.env}-${local.random}"
      resource_group_name = var.resource_group_name
      location            = var.location
      node_resource_group = var.aks_node_rg
      admin_username = var.linux_admin_username

}
```

# Parameters

## resource_groups

(Required) Object that describes the resource groups to be created with their geo.
Global group of tags will be added to all RG, specific tags can be added per RG.

```hcl
variable "resource_group_name" {
  description = "(Required) Name of the resource group where to create the aks"
  type        = string
}
```
Example
```hcl
name = "aks-cluster-rg"
```
## prefix

(optional) Prefix to be added to resources created with this module

```hcl
variable "prefix" {
  description = "Prefix to be added to resources created with this module"
}
```
Example
```hcl
prefix = "aks"
```

## location

(Required) location map of locations to deploy the resources

```hcl
variable "location" {
  description = "(Required) location map of locations to deploy the resources"
}
```
Example
```hcl
location = {
  region1 = "southeastasia"
  region2 = "eastasia"
}

```
## tags

(required) tags map for the tags that will be added to resources in the deployment

```hcl
variable "tags" {
  description = "(required) tags map for the tags that will be added to resources in the deployment"
}
```
Example
```hcl
tags = {
    environment     = "DEV"
    owner           = "BrettOJ"
    deploymentType  = "Terraform"
    costCenter      = "1664"
    BusinessUnit    = "SHARED"
    DR              = "NON-DR-ENABLED"
}
```
## service_principal

(optional) the service principal to be used by the AKS cluster

```hcl
service_principal = {
    client_id     = "client_id"
    client_secret = "client_secret"
  }
```
Example
```hcl
service_principal = {
    client_id     = "00000000000000000000000000000000"
    client_secret = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx"
  }
```
## aks_cluster_name

(required) aks cluster name to be used for the cluster

```hcl
variable  aks_cluster_name" {
  description = "(required) aks cluster name to be used for the cluster"
}
```
Example
```hcl
aks_cluster_name = "test-aks1"
```

## diagnostics_map
(Required) Map with the diagnostics repository information"
```hcl
variable "diagnostics_map" {
 description = "(Required) Map with the diagnostics repository information"
}
```
Example
```hcl
diagnostics_map = {
          diags_sa = "/subscriptions/00000000-0000-0000-0000-00000000/resourceGroups/resource_group_name/providers/Microsoft.Storage/storageAccounts/name_space_storage_account",
          eh_id = "/subscriptions/00000000-0000-0000-0000-00000000/resourceGroups/resource_group_name/providers/Microsoft.EventHub/namespaces/name_space_name",
          eh_name = "name_space_name"
        }
```
## log_analytics_workspace_id
(Required) Log Analytics Workspace details
```hcl
variable "log_analytics_workspace_id" {
  description = "(Required) Log Analytics ID for the AzFW diagnostics"
}
```
Example
```hcl
  log_analytics_workspace_id =  "/subscriptions/00000000-0000-0000-0000-000000000000/resourcegroups/resource_group_name/providers/microsoft.operationalinsights/workspaces/workspace_name"
```

## diag_object
(Required) Map with the settings for diagnostics of the AKS Cluster
```hcl
variable "diag_object" {
 description = "(Required) Map with the diagnostics repository information"
}
```
Example

```hcl
diag_object = {
        log = [
            #["Category name",  "Diagnostics Enabled", "Retention Enabled", Retention period] 
            ["kube-apiserver", true, true, 30],
            ["kube-controller-manager", true, true, 30],
            ["kube-scheduler", true, true, 30],
            ["kube-audit", true, true, 30],
            ["cluster-autoscaler", true, true, 30]
        ]
        metric = [
            ["AllMetrics", true, true, 30],
        ]
}

```

## convention
(Required) Naming convention to be used.
```hcl
variable "convention" {
  description = "(Required) Naming convention used"
}
```
Example
```hcl
convention = "cafclassic"
```

# Output

## object

Returns the full set of created resource groups as a map, as follows:

```hcl


```
