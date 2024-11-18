variable "app_name_prefix" {
  description = "Application name prefix"
  type        = string
  default     = "Miggo_Azure_Reader"
}

variable "secret_display_name" {
  description = "Display name for the application secret"
  type        = string
  default     = "annual-secret"
}

variable "secret_validity_hours" {
  description = "Validity period for the secret in hours"
  type        = number
  default     = 8760 # 365 days
}
