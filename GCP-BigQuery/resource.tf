resource "google_bigquery_dataset" "dataset01" {
  dataset_id    = join("_", ["BQdatasetTF",var.env,"01"])
  friendly_name = "BQdataset_test"
  description   = "This dataset was remotely deployed using Terraform"
  location      = var.project_region
  #default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset02" {
  dataset_id    = join("_", ["BQdatasetTF",var.env,"02"])
  friendly_name = "BQdataset_test"
  description   = "This dataset was remotely deployed using Terraform"
  location      = var.project_region
  #default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  delete_contents_on_destroy = true
}

resource "google_bigquery_dataset" "dataset03" {
  dataset_id    = join("_", ["BQdatasetTF",var.env,"03"])
  friendly_name = "BQdataset_test"
  description   = "This dataset was remotely deployed using Terraform"
  location      = var.project_region
  #default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }

  delete_contents_on_destroy = true
}