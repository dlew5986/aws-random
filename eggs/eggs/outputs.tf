output "backend_config" {
  value = module.egg_tf_state.config
}

output "provisioning_config" {
  value = module.egg_tf_provisioner.config
}
