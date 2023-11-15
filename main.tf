resource "google_monitoring_dashboard" "custom_dashboard" {
  project = var.project
  dashboard_json = jsonencode({
    displayName = var.display_name,
    gridLayout = {
      widgets = [
        for widget in var.widgets : {
          title = widget.title
          xyChart = {
            dataSets = [
              for chart_meta in widget.data_series : {

                timeSeriesQuery = {
                  timeSeriesFilter = {
                    filter = chart_meta.filter
                    aggregation = {
                      perSeriesAligner = chart_meta.series_aligner
                    }
                  }
                  unitOverride = "1"
                }
                plotType = chart_meta.plot_type
              }
            ]
            timeshiftDuration = "0s"
            yAxis = {
              label = "y1Axis"
              scale = "LINEAR"
            }
          }
        }
      ]
    }
  })
}