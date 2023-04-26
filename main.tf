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
  dashboard_uids = {
    "database-dashboard"     = random_string.random["lock-insights"].result,
    "monitoring-dashboard"   = random_string.random["transaction-insights"].result,
    "query-insights"         = random_string.random["query-details"].result,
    "read-insights"          = random_string.random["read-details"].result,
    "transaction-insights"   = random_string.random["transaction-details"].result,
    "active-queries-summary" = "does-not-matter",
    "lock-insights"          = "does-not-matter",
    "query-details"          = "does-not-matter",
    "read-details"           = "does-not-matter",
    "transaction-details"    = "does-not-matter",
  }
}

resource "random_string" "random" {
  for_each = local.dashboard_set
  length   = 12
  special  = false
}

resource "grafana_dashboard" "spanner" {
  folder    = var.folder_id
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
      ALT_LINK_UID                = local.dashboard_uids[each.key]
    }
  )
}
