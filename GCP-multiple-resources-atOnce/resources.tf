resource "google_bigquery_dataset" "dataset" {
  # apesar da sintaxe não deixar claro for_each é um operador, uma palavra reservada no tf
  for_each = toset(var.resource_names)

  dataset_id = join("_", ["BQdatasetTF", var.env, each.value])
  # 'each' também é palavra reservada que referencia um item do obj iteravél em cada repetição.
  friendly_name = "BQdataset_test"
  description   = "This dataset was remotely deployed using Terraform"
  location      = var.project4test.project_region
  #default_table_expiration_ms = 3600000

  labels = {
    env = "default"
  }
  delete_contents_on_destroy = true
}