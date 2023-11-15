# Terraform Monitoring Dashboard Module

## Overview

This Terraform module enables the creation of a custom monitoring dashboard using Google Cloud Monitoring. It allows to define widgets and their configurations in a modular and reusable manner.

## Features

- Create a custom monitoring dashboard on Google Cloud Monitoring.
- Define widgets with configurable data series and chart properties.
- Modular structure for easy reuse across projects.

## Usage

```hcl
module "custom_dashboard" {
  source       = "path/to/your/module"
  project      = "your-gcp-project"
  display_name = "My Custom Dashboard"

  widgets = [
    {
      title       = "Widget 1"
      data_series = [
        {
          filter         = "metric.type=\"compute.googleapis.com/instance/disk/write_bytes_count\""
          series_aligner = "ALIGN_RATE"
          plot_type      = "LINE"
        },
        # Additional data series for Widget 1
      ]
    },
    {
      title       = "Widget 2"
      data_series = [
        # Data series for Widget 2
      ]
    },
    # Additional widgets
  ]
}
