variable "env" {
  description   = "Name of the environment (e.g. Dev, Prod)"
  default       = "dev"
}

variable "location" {
  description   = "Azure region for resources"
  default       = "eastus"
}

variable "your_id" {
    description     =   "unique id to help facilitate tutorial"
    default         =   "dacrook"
}