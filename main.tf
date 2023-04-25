terraform {
  required_providers {
    grafana = {
      source  = "grafana/grafana"
      version = "~> 1.20"
    }
  }
}

locals {
  dashboard_set = toset(var.dashboards)
}

resource "random_string" "random" {
  for_each = local.dashboard_set
  length   = 12
  special  = false
}

resource "grafana_folder" "env_folder" {
  title = var.folder_name
}

resource "grafana_dashboard" "spanner" {
  folder    = grafana_folder.env_folder.id
  for_each  = local.dashboard_set
  overwrite = var.overwrite_dashboard

  config_json = templatefile(
    "${path.module}/dashboards/${each.key}.json",
    {
      ENVIRONMENT_REPLACE         = var.environment,
      GCP_DATASOURCE_REPLACE      = var.gcp_datasource,
      GCP_DATASOURCE_UID_REPLACE  = var.gcp_datasource_uid,
      NOTIFICATION_REPLACE        = var.notification_channel,
      PRODUCT_REPLACE             = var.product_name,
      PROJECT_REPLACE             = var.project_name,
      PROM_DATASOURCE_REPLACE     = var.prom_datasource,
      PROM_DATASOURCE_UID_REPLACE = var.prom_datasource_uid,
      SERVICE_REPLACE             = var.service_name,
      UID_REPLACE                 = random_string.random[each.key].result
    }
  )
}
