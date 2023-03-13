resource "azurerm_databricks_workspace" "databricks_workspace" {
  name                = "databricks-test"
  resource_group_name = azurerm_resource_group.resource_group.name
  location            = azurerm_resource_group.resource_group.location
  sku                 = "standard"

  tags = {
    Environment = "Production"
  }

  depends_on = [
    azurerm_resource_group.resource_group
  ]
}

provider "databricks" {
  host = "https://adb-4993916084139836.16.azuredatabricks.net"
  token = "dapi2bc8eebf7130a15bc604715f529f0941-2"
}

data "databricks_node_type" "smallest" {
  local_disk = true
}

data "databricks_spark_version" "latest_lts" {
  long_term_support = true
}

resource "databricks_cluster" "shared_autoscaling" {
  cluster_name            = "Shared Autoscaling"
  spark_version           = data.databricks_spark_version.latest_lts.id
  node_type_id            = data.databricks_node_type.smallest.id
  autotermination_minutes = 20
  num_workers             = 1
}