module "label" {
  source          = "github.com/willdafoe/terraform-context-label.git"
  for_each        = var.labels
  enabled         = module.this.enabled
  name            = var.name
  namespace       = var.namespace
  environment     = var.environment
  location        = var.location
  stage           = var.stage
  delimiter       = var.delimiter
  attributes      = each.value.attributes
  tags            = var.tags
  label_order     = var.label_order
  id_length_limit = each.value.id_length_limit
  context         = module.this.context
}