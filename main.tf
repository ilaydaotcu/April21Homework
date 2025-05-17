terraform {
    backend "s3" {
        bucket = "mystatebackend5256"
        key = "multiple_workspaces_terraform.tfstate"
        region = "us-east-1"      
    }
}

provider "tfe" {
    version = "~> 0.64.0"
}

variable "environments" {
   type = list(string)
   default = ["dev" , "twitter" , "instagram" , "facebook" , "gamestop" ]
} 

resource "tfe_workspace" "test" {
  for_each = toset(var.environments)
  name = "network-${each.key}"
  organization = "CL030-DevOps2025"
}