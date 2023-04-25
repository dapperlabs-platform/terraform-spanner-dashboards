## Example

TODO

NOTE: If you want to use this you must have the `opentelemetry-collector-contrib` collector installed and pulling metrics to your Prometheus instance AND have access to the GCP Spanner Metrics.

See [https://github.com/open-telemetry/opentelemetry-helm-charts](https://github.com/open-telemetry/opentelemetry-helm-charts) and [https://github.com/open-telemetry/opentelemetry-collector-contrib](https://github.com/open-telemetry/opentelemetry-collector-contrib).

This was created based on previous work [https://github.com/architjugran/example-cloudspannerreceiver](https://github.com/architjugran/example-cloudspannerreceiver) and [https://cloud.google.com/blog/products/databases/consume-spanner-metrics-using-opentelemetery](https://cloud.google.com/blog/products/databases/consume-spanner-metrics-using-opentelemetery)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_grafana"></a> [grafana](#requirement\_grafana) | ~> 1.20 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_grafana"></a> [grafana](#provider\_grafana) | ~> 1.20 |
| <a name="provider_random"></a> [random](#provider\_random) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [grafana_dashboard.spanner](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/dashboard) | resource |
| [grafana_folder.env_folder](https://registry.terraform.io/providers/grafana/grafana/latest/docs/resources/folder) | resource |
| [random_string.random](https://registry.terraform.io/providers/hashicorp/random/latest/docs/resources/string) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_dashboards"></a> [dashboards](#input\_dashboards) | Install these dashboards | `list(any)` | <pre>[<br>  "active-queries-summary",<br>  "database-dashboard",<br>  "lock-insights",<br>  "monitoring-dashboard",<br>  "query-details",<br>  "query-insights",<br>  "read-details",<br>  "read-insights",<br>  "transaction-details",<br>  "transaction-insights"<br>]</pre> | no |
| <a name="input_environment"></a> [environment](#input\_environment) | Environment | `string` | n/a | yes |
| <a name="input_folder_name"></a> [folder\_name](#input\_folder\_name) | Grafana Folder Name | `string` | n/a | yes |
| <a name="input_gcp_datasource"></a> [gcp\_datasource](#input\_gcp\_datasource) | GCP Datasource | `string` | n/a | yes |
| <a name="input_gcp_datasource_uid"></a> [gcp\_datasource\_uid](#input\_gcp\_datasource\_uid) | GCP Datasource UID | `string` | n/a | yes |
| <a name="input_notification_channel"></a> [notification\_channel](#input\_notification\_channel) | Notification Channel | `string` | n/a | yes |
| <a name="input_overwrite_dashboard"></a> [overwrite\_dashboard](#input\_overwrite\_dashboard) | Always overwrite from Terraform | `bool` | `true` | no |
| <a name="input_product_name"></a> [product\_name](#input\_product\_name) | Product Name | `string` | n/a | yes |
| <a name="input_project_name"></a> [project\_name](#input\_project\_name) | Project Name | `string` | n/a | yes |
| <a name="input_prom_datasource"></a> [prom\_datasource](#input\_prom\_datasource) | Prometheus Datasource | `string` | n/a | yes |
| <a name="input_prom_datasource_uid"></a> [prom\_datasource\_uid](#input\_prom\_datasource\_uid) | Prometheus Datasource UID | `string` | n/a | yes |
| <a name="input_service_name"></a> [service\_name](#input\_service\_name) | Service Name | `string` | n/a | yes |

## Outputs

No outputs.
