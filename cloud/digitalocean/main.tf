terraform {
  required_version = "~> 0.11"
}

variable "DigitalOcean_Region" {
  description =<<EOF
What region should the server be located in?
  1.  Amsterdam        (Datacenter 2)
  2.  Amsterdam        (Datacenter 3)
  3.  Frankfurt
  4.  London
  5.  New York         (Datacenter 1)
  6.  New York         (Datacenter 2)
  7.  New York         (Datacenter 3)
  8.  San Francisco    (Datacenter 1)
  9.  San Francisco    (Datacenter 2)
  10. Singapore
  11. Toronto
  12. Bangalore
Enter the number of your desired region
EOF
}

locals {
  regions = {
    "1"  = "ams2"
    "2"  = "ams3"
    "3"  = "fra1"
    "4"  = "lon1"
    "5"  = "nyc1"
    "6"  = "nyc2"
    "7"  = "nyc3"
    "8"  = "sfo1"
    "9"  = "sfo2"
    "10" = "sgp1"
    "11" = "tor1"
    "12" = "blr1"
  }
  region = "${local.regions[var.DigitalOcean_Region]}"
}
