/*
Neste arquivo são definidas quaisquer variaveis que sejam úteis nos blocos de código TF.
Estas variaveis podem ou não ser atribuidas log na definição atraves do atributo default que é opcional no bloco variable{}
Contudo, se a variavel for definida sem valor padrão o Terraform pedira o imput do valor no momento do plan
*/

variable "credentials_file_path" {
  description = "Where the file with the auth keys can be found (locally)"
  type        = string
  default     = "../temp_keys/key_adm.json"
  # isso pode ser melhorado depois com o uso de valores locais 'locals'
}

variable "project_id" {
  description = "The unique GCP project ID"
  type        = string
  default     = "projeto-estudos-356715"
}

variable "project_region" {
  default = "us-central1"
}

variable "project_zone" {
  default = "us-central1-c"
}

variable "env" {
  description = "development enviroment/stage"
  default = "dev"
}