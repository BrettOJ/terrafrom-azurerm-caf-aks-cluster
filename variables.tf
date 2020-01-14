variable "resource_groups" {
  description = "(required) map of the resource groups to be created"
}

variable "prefix" {
  description = "A prefix used for all resources in this example"
}

variable "location" {
  description = "(required)The Azure Region in which all resources in this example should be provisioned"
}

variable "tags" {
  description = "(required) the map of the tags to be applied to the resources deployed" 
}

variable "service_principal" {
  description = "(Required) The Client ID and client secret block for the Service Principal to use for this Managed Kubernetes Cluster"
}

variable "aks_cluster_name" {
  description = "(Required) base name for the AKS cluster"
}

variable "log_analytics_workspace_id" {
  description = "(Required) the log analytics workspace ID to be used for the AKS cluster logs"
}

variable "diagnostics_map" {
  description = "(Required) map of the diagnostic settings to be used for the eventhub and storage account"
}

variable "diag_object" {
  description = "(Required) list of monitor and log settings to be measured"
}
variable "dns_prefix" {
    description = "(Required) dns prefix for the hostname of the AKS cluster"
}
variable "naming_convention" {
  description = "(Required) caf naming module convention to be applied to the name of the cluster"
}
variable "default_node_pool" {
  description = "(Required) map object for the default node pool settings"
}

