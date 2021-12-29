## This configuration was generated by terraform-provider-oci

resource oci_artifacts_container_configuration export_container_configuration {
  compartment_id                      = vars.compartment_id
  is_repository_created_on_first_push = "true"
}

resource oci_artifacts_container_repository export_oracle-cbi-oci-cbi {
  compartment_id = oci_artifacts_container_configuration.export_container_configuration.id
  display_name   = "oracle-cbi/oci-cbi"
  is_immutable   = "false"
  is_public      = "false"
}

