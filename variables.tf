variable "display_name" {
  description = "Custom Dashboard Display Name"
  type        = string
}

variable "widgets" {
  type = list(object({
    title = string
    data_series = list(object({
      filter         = string
      plot_type      = string
      series_aligner = string
    }))
  }))
}

variable "project" {
  description = "Identifier for the project"
  type        = string
}
