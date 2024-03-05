terraform {
  required_version = ">= 1.0.0"
 
  required_providers {
    digitalocean = {
      source  = "digitalocean/digitalocean"
      version = "~> 2.0"
    }
  }
}
 
provider "digitalocean" {
  token = "your-digitalocean-token"
}
 
resource "digitalocean_droplet" "web" {
  image  = "ubuntu-20-04-x64"
  name   = "tugas-akhir"
  region = "sgp1"
  size   = "s-4vcpu-8gb-amd"
}