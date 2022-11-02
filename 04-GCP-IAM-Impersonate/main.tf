terraform {
  required_providers {
    google = {
        source = "hashicorp/google"
    }
  }
}

# 0 - variavel local da conta de servico com permissão para provisionar recurso (configurada no IAM)
locals {
 terraform_service_account = "<YOUR SERVICE ACCOUNT EMAIL ADDRES>"
}


# 1 - Provider utilizado somente para obter o token de acesso da conta de serviço
provider "google" {
 alias = "impersonation"
 scopes = [
   "https://www.googleapis.com/auth/cloud-platform",
   "https://www.googleapis.com/auth/userinfo.email",
 ]
}

# 2 - O token é recuperado com o bloco data{}, vale lembrar que esse tipo de bloco "varre" os dados de um provider ainda em fase de ->terraform plan ,isto é, mesmo antes do deploy com ->terraform apply 
data "google_service_account_access_token" "default" {
 provider               	= google.impersonation
 target_service_account 	= local.terraform_service_account
 scopes                 	= ["userinfo-email", "cloud-platform"]
 lifetime               	= "600s"
}

#3 - 
provider "google" {
 project 		= "<YOUR PROJECT ID>"
 access_token	= data.google_service_account_access_token.default.access_token
 request_timeout 	= "60s"
}

# exemplo: provisionando um Google Cloud Storage bucket 
resource "google_storage_bucket" "default" {
  name          = "<YOUR UNIQUE BUCKET NAME>"
  location      = "us-central1"
  force_destroy = true
  storage_class = "ARCHIVE"
}




