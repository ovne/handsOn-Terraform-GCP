

variable "project4test" {
  description = "a group of all common GCP project attributes"
  type        = map(any)
  default = {
    credentials_file_path = "../.provider_keys/gcp-keys.json"
    project_id            = "projeto-estudos-356715"
    project_region        = "us-central1"
    project_zone          = "us-central1-c"
  }
}

variable "resource_names" {
  description = "a list of names to iterate and create resources"
  type        = list(string)
  default     = ["alpha", "beta", "omega"]
}

variable "env" {
  description = "development enviroment/stage"
  default     = "dev"
}

