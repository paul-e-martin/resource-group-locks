variable "lock_level" {
  description = "lock level for the resource group"
  type        = string
  default     = "CanNotDelete"

  validation {
    condition     = contains(["ReadOnly", "CanNotDelete"], var.lock_level)
    error_message = "The lock_level must be either 'ReadOnly' or 'CanNotDelete'"
  }
}

variable "subscription_id" {
  type = string
}

variable "resource_group_name" {
  type = string
}

variable "storage_account_name" {
  type = string
}

variable "container_name" {
  type = string
}

variable "key" {
  type = string
}

variable "landing_zone_subscription_id" {
  type = string
}
