#!/bin/bash

node aws/aws_compute_rightsizing_idle.js > aws/aws_compute_rightsizing_idle.json
node aws/aws_compute_rightsizing_underutil.js > aws/aws_compute_rightsizing_underutil.json
node aws/aws_delete_old_snapshots.js > aws/aws_delete_old_snapshots.json
node aws/aws_delete_unused_volumes.js > aws/aws_delete_unused_volumes.json
node aws/aws_reserved_instance_recommendations.js > aws/aws_reserved_instance_recommendations.json
node aws/aws_savings_plan_recommendations.js > aws/aws_savings_plan_recommendations.json
node aws/aws_unused_ip_addresses.js > aws/aws_unused_ip_addresses.json
node aws/rds_instance_cloudwatch_utilization.js > aws/rds_instance_cloudwatch_utilization.json
node aws/unused_rds.js > aws/unused_rds.json

node azure/azure_compute_rightsizing.js > azure/azure_compute_rightsizing.json
node azure/azure_delete_old_snapshots.js > azure/azure_delete_old_snapshots.json
node azure/azure_delete_unattached_volumes.js > azure/azure_delete_unattached_volumes.json
node azure/azure_reserved_instance_recommendations.js > azure/azure_reserved_instance_recommendations.json
node azure/azure_rightsize_sql_instances.js > azure/azure_rightsize_sql_instances.json
node azure/azure_savings_plan_recommendations.js > azure/azure_savings_plan_recommendations.json
node azure/azure_unused_ip_addresses.js > azure/azure_unused_ip_addresses.json
node azure/azure_unused_sql_databases.js > azure/azure_unused_sql_databases.json

node google/google_committed_use_discount_recommendations.js > google/google_committed_use_discount_recommendations.json
node google/google_idle_ip_address_recommendations.js > google/google_idle_ip_address_recommendations.json
node google/google_idle_persistent_disk_recommendations.js > google/google_idle_persistent_disk_recommendations.json
node google/google_rightsize_vm_recommendations.js > google/google_rightsize_vm_recommendations.json
node google/google_sql_idle_instance_recommendations.js > google/google_sql_idle_instance_recommendations.json
node google/google_vm_recommendations.js > google/google_vm_recommendations.json
