variable "folder_id" {
  description = "Grafana Folder ID"
  type        = string
}

variable "prom_datasource" {
  description = "Prometheus Datasource"
  type        = string
}

variable "prom_datasource_uid" {
  description = "Prometheus Datasource UID"
  type        = string
}

variable "gcp_datasource" {
  description = "GCP Datasource"
  type        = string
}

variable "gcp_datasource_uid" {
  description = "GCP Datasource UID"
  type        = string
}

variable "environment" {
  description = "Environment"
  type        = string
}

variable "project_name" {
  description = "Project Name"
  type        = string
}

variable "product_name" {
  description = "Product Name"
  type        = string
}

variable "notification_channel" {
  description = "Notification Channel"
  type        = string
}

variable "service_name" {
  description = "Service Name"
  type        = string
}

variable "dashboards" {
  description = "Install these dashboards"
  type        = list(any)
  default = [
    "active-queries-summary",
    "database-dashboard",
    "lock-insights",
    "monitoring-dashboard",
    "query-details",
    "query-insights",
    "read-details",
    "read-insights",
    "transaction-details",
    "transaction-insights"
  ]
}

variable "overwrite_dashboard" {
  description = "Always overwrite from Terraform"
  type        = bool
  default     = true
}
