# bloco terraform
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      #version = "4.3.0"
    }
  }
}

# bloco provider
provider "google" {
  credentials = file(var.credentials_file_path)
  project     = var.project_id
  region      = var.project_region
  zone        = var.project_zone
}