variable "cluster_name" {
  type = string
}

variable "enable_container_insights" {
  type = bool
}

variable "ecr_repository_settings" {
  type = object({
    image_tag_mutability         = string
    force_delete                 = bool
    image_scanning_configuration = bool
  })
}