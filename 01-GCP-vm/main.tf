# bloco terraform{} : define os parametros gerais do terraform e é onde mais de um provider(cloud)
# pode ser listado
terraform {
  required_providers {
    google = {
      source = "hashicorp/google"
      #version = "3.5.0" #(default: lastest version) descomentar para forçar uma versão especifica do TF 
    }
  }
}

# bloco provider{} : define os parametos de um provider. 'providers' são plugins que o TF usa para acessar
# e gerenciar os recursos de infra
provider "google" {
  credentials = file("../temp_keys/resource-adm-keys.json")
  project     = "projeto-estudos-356715"
  region      = "us-central1"
  zone        = "us-central1-c"
}

#bloco resource{} : define os parametros de um unico recurso do provider (vm, bucket, network, etc.)
# todo bloco resource é iniciado coom "<tipo>" "<nome>". Tipo é cte predefinida, mas nome é personalizavel  
resource "google_compute_instance" "VMfromTF" {
  name         = "vm-from-tf"
  machine_type = "e2-micro" # 'e2-micro' vm mais simples para não incorrer em cobrança
  zone         = "us-central1-c"

  #define as tags da instancia de vm (opcional)
  #tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral public IP
    }
  }

  # executa algum script no boot da VM, nesse exemplo, cria um arquivo com o texto 'Ola Mundo'
  metadata_startup_script = "echo Olá Mundo > /test-terraform.txt"
}

