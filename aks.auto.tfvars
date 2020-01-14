

# Set of resource groupds to land the blueprint
resource_groups = {
    SPOKE-RG-AKS   = {
        name = "-aks-cluster-rg"
        location = "southeastasia"
    }

}

prefix = "aks_cluster"

location = "southeastasia"

#Set of tags for core operations: includes core resources for hub
tags = {
    environment     = "DEV"
    owner           = "Avanade"
    deploymentType  = "Terraform"
    costCenter      = "1664"
    BusinessUnit    = "SHARED"
    DR              = "NON-DR-ENABLED"
}

service_principal = {
    client_id     = "0f8c8540-1411-4b04-b1e8-5438c1ace8a4"
    client_secret = "VT=uSgbTanZhyz@%nL9Hpd+Tfay_MRV#"
  }

aks_cluster_name = "test-aks1"

log_analytics_workspace_id = "/subscriptions/d31d8f8e-eeb2-4a48-a33a-ceb7fab17378/resourcegroups/tbuh-hub-operations/providers/microsoft.operationalinsights/workspaces/tbuhlalogs"

dns_prefix = "dns-prefix"

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

diagnostics_map = {
          diags_sa = "/subscriptions/d31d8f8e-eeb2-4a48-a33a-ceb7fab17378/resourceGroups/uhgs-hub-operations/providers/Microsoft.Storage/storageAccounts/opslogsuhgsspz",
          eh_id = "/subscriptions/d31d8f8e-eeb2-4a48-a33a-ceb7fab17378/resourceGroups/uhgs-hub-operations/providers/Microsoft.EventHub/namespaces/opslogsuhgsspz",
          eh_name = "opslogsuhgsspz"
        }

default_node_pool = {
        name = "aksnodepool" 
        vm_size = "Standard_D2_v2"
        node_count = 1

        #availability_zones = ""
        enable_auto_scaling = false
        enable_node_public_ip = false
        #max_pods = 10
        #node_taints = "string"
        #os_disk_size_gb = 60
        #type = "VirtualMachineScaleSets" # "AvailabilitySet"
        #vnet_subnet_id = "string"
        #If enable_auto_scaling is set to true, then the following fields can also be configured:
        #max_count = 4
        #min_count  = 1  
}
naming_convention = "cafclassic"