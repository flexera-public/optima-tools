#!/bin/bash

node flexera/data/aws/aws_compute_rightsizing_idle.js > flexera/data/aws/aws_compute_rightsizing_idle.json
node flexera/data/aws/aws_compute_rightsizing_underutil.js > flexera/data/aws/aws_compute_rightsizing_underutil.json
node flexera/data/aws/aws_delete_old_snapshots.js > flexera/data/aws/aws_delete_old_snapshots.json
node flexera/data/aws/aws_delete_unused_volumes.js > flexera/data/aws/aws_delete_unused_volumes.json
node flexera/data/aws/aws_reserved_instance_recommendations.js > flexera/data/aws/aws_reserved_instance_recommendations.json
node flexera/data/aws/aws_savings_plan_recommendations.js > flexera/data/aws/aws_savings_plan_recommendations.json
node flexera/data/aws/aws_unused_ip_addresses.js > flexera/data/aws/aws_unused_ip_addresses.json
node flexera/data/aws/rds_instance_cloudwatch_utilization.js > flexera/data/aws/rds_instance_cloudwatch_utilization.json
node flexera/data/aws/unused_rds.js > flexera/data/aws/unused_rds.json

node flexera/data/azure/azure_compute_rightsizing.js > flexera/data/azure/azure_compute_rightsizing.json
node flexera/data/azure/azure_delete_old_snapshots.js > flexera/data/azure/azure_delete_old_snapshots.json
node flexera/data/azure/azure_delete_unattached_volumes.js > flexera/data/azure/azure_delete_unattached_volumes.json
node flexera/data/azure/azure_reserved_instance_recommendations.js > flexera/data/azure/azure_reserved_instance_recommendations.json
node flexera/data/azure/azure_rightsize_sql_instances.js > flexera/data/azure/azure_rightsize_sql_instances.json
node flexera/data/azure/azure_savings_plan_recommendations.js > flexera/data/azure/azure_savings_plan_recommendations.json
node flexera/data/azure/azure_unused_ip_addresses.js > flexera/data/azure/azure_unused_ip_addresses.json
node flexera/data/azure/azure_unused_sql_databases.js > flexera/data/azure/azure_unused_sql_databases.json

node flexera/data/google/google_committed_use_discount_recommendations.js > flexera/data/google/google_committed_use_discount_recommendations.json
node flexera/data/google/google_idle_ip_address_recommendations.js > flexera/data/google/google_idle_ip_address_recommendations.json
node flexera/data/google/google_idle_persistent_disk_recommendations.js > flexera/data/google/google_idle_persistent_disk_recommendations.json
node flexera/data/google/google_rightsize_vm_recommendations.js > flexera/data/google/google_rightsize_vm_recommendations.json
node flexera/data/google/google_sql_idle_instance_recommendations.js > flexera/data/google/google_sql_idle_instance_recommendations.json
node flexera/data/google/google_vm_recommendations.js > flexera/data/google/google_vm_recommendations.json
