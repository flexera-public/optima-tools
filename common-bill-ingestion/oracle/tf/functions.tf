## This configuration was generated by terraform-provider-oci

resource oci_functions_application export_oracle_bill_upload {
  compartment_id = oci_artifacts_container_configuration.export_container_configuration.id
  config = {
  }
  defined_tags = {
    "Oracle-Tags.CreatedBy" = var.tag_created_by
    "Oracle-Tags.CreatedOn" = var.tag_created_on
  }
  display_name = "oracle_bill_upload"
  freeform_tags = {
  }
  subnet_ids = [
    oci_core_subnet.export_Public-Subnet.id,
  ]
  syslog_url = ""
}

resource oci_functions_function export_oci-cbi {
  application_id = oci_functions_application.export_oracle_bill_upload.id
  config = {
    "DOWNLOAD_ALL"  = "False"
    "REFRESH_TOKEN" = "1984132d9be38cd7186e8e25f7ef9081047c9911"
  }
  defined_tags = {
    "Oracle-Tags.CreatedBy" = var.tag_created_by
    "Oracle-Tags.CreatedOn" = var.tag_created_on
  }
  display_name = "oci-cbi"
  freeform_tags = {
  }
  image              = "iad.ocir.io/idvr1cmuzthz/oracle-cbi/oci-cbi:0.0.24"
  image_digest       = "sha256:3c08f02c405d64eef07fc08afec129d8e675a01e46dbda5fa0903985a007d6d6"
  memory_in_mbs      = "1024"
  timeout_in_seconds = "300"
}
