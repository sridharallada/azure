global_tags = {
  Provisioner  = "Terraform"
}
resource_groups = {
  TEAM-A = {
    location   = "canadacentral",
    tags       = {
      Owner      = "Sridhar",
      CostCenter = "C8888",
      Description = "Resource groups for TEAM-A Resources"} }

  TEAM-B = {
    location   = "canadacentral",
    tags       = {
      Owner      = "Sridhar",
      CostCenter = "C9999",
      Description = "Resource groups for TEAM-B Resources"} }
}