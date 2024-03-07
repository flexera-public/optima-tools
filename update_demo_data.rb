# Update Demo Data
# This script updates the demo data.

###############################################################################
# Required Libraries
###############################################################################

require 'uri'
require 'json'
require 'time'

###############################################################################
# AWS Data Methods
###############################################################################

def get_random_aws_account
  aws_account_list = [
    "999773517191",
    "138186646095",
    "353197488767",
    "516702013600",
    "627286410625",
    "165283112664",
    "646728909564",
    "620368136857",
    "665319725593",
    "925894598672",
    "766083082562"
  ]

  return aws_account_list.sample
end

def get_random_aws_region
  aws_region_list = [
    "us-east-2",
    "us-east-1",
    "us-west-1",
    "us-west-2",
    "ap-east-1",
    "ap-northeast-3",
    "ca-central-1",
    "eu-central-1",
    "eu-west-1",
    "eu-west-2"
  ]

  return aws_region_list.sample
end

def get_random_aws_region_pretty
  aws_region_list = [
    "EU (London)",
    "US East (N. Virginia)",
    "Asia Pacific (Mumbai)",
    "EU (Frankfurt)",
    "Asia Pacific (Tokyo)",
    "Asia Pacific (Sydney)",
    "US West (Oregon)",
    "EU (Ireland)",
    "EU (Paris)",
    "Asia Pacific (Singapore)"
  ]

  return aws_region_list.sample
end

def get_random_aws_ec2_size
  aws_ec2_type_list = [
    [ "c5n.xlarge",  "c4n.xlarge",  "c3n.xlarge"  ],
    [ "m6i.8xlarge", "m5i.8xlarge", "m4i.8xlarge" ],
    [ "r5.2xlarge",  "r4.2xlarge" , "r3.2xlarge"  ],
    [ "m5.8xlarge",  "m4.8xlarge",  "m3.8xlarge"  ],
    [ "r5.xlarge",   "r4.xlarge",   "r3.xlarge"   ],
    [ "c4n.xlarge",  "c3n.xlarge",  "c2n.xlarge"  ],
    [ "m5i.8xlarge", "m4i.8xlarge", "m3i.8xlarge" ],
    [ "r4.2xlarge",  "r3.2xlarge",  "r2.2xlarge"  ],
    [ "m4.8xlarge",  "m3.8xlarge",  "m2.8xlarge"  ],
    [ "c4n.xlarge",  "c3n.xlarge",  "c2n.xlarge"  ]
  ]

  return aws_ec2_type_list.sample
end

###############################################################################
# Azure Data Methods
###############################################################################

def get_random_azure_account
  azure_account_list = [
    "ca1eeeca-231f-4a91-a740-04eaeb043516",
    "ceee86e2-a6cf-4a62-8004-1313cc581679",
    "1aec08f2-c15d-4c32-919c-4bab940f69f3",
    "13e8d4fc-8226-45a0-88cf-2979d3e9eba9",
    "1af450b2-ce7a-4af5-9ebc-a13461fe1e32",
    "6383b3a2-a8c4-4c07-8acf-f38e08fc7622",
    "8752afcb-f9b4-453b-b34c-cb9f3a9a0247",
    "9c6588cd-ca5e-429d-adc7-5292d3880914",
    "912102ae-2e57-4094-bb8a-63a7d1c38207",
    "57e25d4f-1ba6-4ac3-8ae9-455e3f0236ec",
    "f048a88c-9bc9-43cf-a30d-f48c94708866"
  ]

  return azure_account_list.sample
end

def get_random_azure_region
  azure_region_list = [
    "southcentralus",
    "eastus",
    "eastus2",
    "westus2",
    "australiaeast",
    "southeastasia",
    "northeurope",
    "uksouth",
    "centralus",
    "centralindia"
  ]

  return azure_region_list.sample
end

def get_random_azure_compute_size
  azure_compute_type_list = [
    [ "Standard_A2_v2",    "Standard_A1_v2"    ],
    [ "Standard_A4_v2",    "Standard_A3_v2"    ],
    [ "Standard_B12ms",    "Standard_B8ms"     ],
    [ "Standard_B16as_v2", "Standard_B12as_v2" ],
    [ "Standard_B16ms",    "Standard_B12ms"    ],
    [ "Standard_B2ms",     "Standard_B1ms"     ],
    [ "Standard_B2s",      "Standard_B1s"      ],
    [ "Standard_B32as_v2", "Standard_B16as_v2" ],
    [ "Standard_D16_v3",   "Standard_D8_v3"    ],
    [ "Standard_B4ms",     "Standard_B2ms"     ]
  ]

  return azure_compute_type_list.sample
end

def get_random_azure_db_ri_sku
  azure_db_sku_list = [
    "SQLMI_BC_Compute_Gen5",
    "SQLDB_HyperScale_Compute_Gen5",
    "SQLDB_BC_Compute_Gen5",
    "SQLDB_GP_Compute_Gen5",
    "SQLMI_BC_Compute_Gen5",
    "SQLMI_GP_Compute_Gen5",
    "SQLMI_BC_Compute_Gen5",
    "SQLDB_HyperScale_Compute_Gen5",
    "SQLDB_BC_Compute_Gen5",
    "SQLDB_GP_Compute_Gen5"
  ]

  return azure_db_ri_sku_list.sample
end

def get_random_azure_meter
  azure_meter_list = [
    "b63d64fe-ebd5-42b6-b3f9-a4d129af7cb1",
    "93d67b35-6ba6-4d8f-8d2e-7348b4fe67e9",
    "8175f1bd-7d38-4fd7-a38f-789dbaa8594d",
    "d2c568ba-3bf1-4b2c-867a-c6fe097a79a2",
    "6d6e5e2b-45c9-42c3-8fe5-1f50a6a63f96",
    "f8bb8cde-69d2-460d-9277-3d5466da6aa7",
    "64b0fb7d-a3cd-4f16-8aeb-8b47fb47a56c",
    "d1b4cb48-2dc5-4626-a5cb-f4d97c00e99a",
    "a4f6cb5a-40fb-4061-9b37-e4c61b6a4c51",
    "c7b13d8e-9c9c-4a67-8cfd-824b9b4f79a8"
  ]

  return azure_meter_list.sample
end

###############################################################################
# Google Data Methods
###############################################################################

def get_random_google_compute_size
  google_compute_type_list = [
    [ "e2-standard-8",   "e2-standard-4"   ],
    [ "n2-standard-16",  "n2-standard-8"   ],
    [ "n2-highmem-8",    "n2-highmem-4"    ],
    [ "n2-highcpu-32",   "n2-highcpu-16"   ],
    [ "n2d-standard-64", "n2d-standard-32" ],
    [ "c2-standard-30",  "c2-standard-16"  ],
    [ "m2-ultramem-208", "m2-ultramem-104" ],
    [ "n1-standard-16",  "n1-standard-8"   ],
    [ "n1-highmem-2",    "n1-highmem-1"    ],
    [ "e2-micro",        "e2-nano"         ]
  ]

  return google_compute_type_list.sample
end

def get_random_google_region
  google_region_list = [
    "us-central1",
    "europe-west1",
    "asia-northeast1",
    "us-west1",
    "australia-southeast1",
    "southamerica-east1",
    "northamerica-northeast1",
    "europe-west4",
    "asia-southeast2",
    "europe-west6"
  ]

  return google_region_list.sample
end

def get_random_google_cud_description
  google_cud_description_list = [
    "Purchase a 1 year new standard CUD for RegularCore CPU",
    "Purchase a 1 year new standard CUD for RegularRAM memory",
    "Purchase a 1 year new standard CUD for E2Core CPU",
    "Purchase a 1 year new standard CUD for E2RAM memory",
    "Purchase a 1 year new standard CUD for N2DRAM memory",
    "Purchase a 1 year new standard CUD for N2DCore CPU",
    "Purchase a 1 year additional standard CUD for RegularCore CPU",
    "Purchase a 1 year additional standard CUD for RegularRAM memory",
    "Purchase a 1 year additional standard CUD for E2RAM memory",
    "Purchase a 1 year additional standard CUD for N2DCore CPU"
  ]

  return google_cud_description_list.sample
end

###############################################################################
# General Data Methods
###############################################################################

def get_random_tags
  tag_list = [
    "environment=prod, app=paymentGateway",
    "environment=dev, app=dataAnalytics",
    "environment=prod, app=userManagement",
    "environment=dev, app=reportingService",
    "environment=staging, app=invoiceProcessing",
    "environment=prod, app=emailService",
    "environment=prod, app=securityModule",
    "environment=dev, app=inventoryManagement",
    "environment=prod, app=customerSupport",
    "environment=staging, app=crmModule"
  ]

  return tag_list.sample
end

def get_random_name
  adjectives = [
    "quick", "lazy", "drowsy", "excited", "adventurous", "jolly", "brave", "calm",
    "eager", "fierce", "gentle", "happy", "innocent", "jovial", "kind", "lively",
    "merry", "nervous", "obedient", "proud", "relieved", "silly", "thankful",
    "upbeat", "vivacious", "witty", "excited", "youthful", "zealous", "quirky"
  ]

  animals = [
    "ant", "bear", "cat", "dog", "eel", "fox", "goat", "horse", "ibis", "jaguar",
    "kangaroo", "lion", "mouse", "newt", "owl", "penguin", "quail", "rabbit",
    "snake", "tiger", "urchin", "viper", "whale", "xerus", "yak", "zebra", "parrot",
    "octopus", "giraffe", "elephant"
  ]

  random_adjective = adjectives[rand(adjectives.length)]
  random_animal = animals[rand(animals.length)]

  return "#{random_adjective}#{random_animal}"
end

def get_random_time
  six_months = 6 * 30 * 24 * 60 * 60
  three_years = 3 * 365 * 24 * 60 * 60

  random_seconds = rand(six_months..three_years)
  random_past_time = Time.now - random_seconds

  return random_past_time.iso8601
end

def get_random_date(year)
  start = Time.new(year, 1, 1) # Start from January 1st of the given year
  end_time = Time.new(year + 1, 1, 1) # End at December 31st of the given year
  random_time = start + rand(end_time - start) # Generate a random Time instance within the year

  return random_time.iso8601 # Return the ISO 8601 string representation of the random date
end

###############################################################################
# Misc. Methods
###############################################################################

def write_demo_data(data, filepath)
  File.open(filepath, "w") do |file|
    file.write(JSON.pretty_generate(data))
  end
end

###############################################################################
# Demo Data Generation Methods
###############################################################################

def aws_delete_old_snapshots(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceID": "",
      "resourceName": "",
      "tags": "",
      "age": "",
      "size": "",
      "service": "",
      "recommendationDetails": "",
      "parentType": "",
      "parentId": "",
      "snapshotType": "",
      "description": "",
      "resourceName": "",
      "resourceType": "",
      "imageId": "",
      "region": "",
      "savings": "",
      "savingsCurrency": "",
      "resourceType": "",
      "lookbackPeriod": ""
    }

    result << entry
  end

  return result
end

def aws_delete_unused_volumes(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceID": "",
      "resourceName": "",
      "tags": "",
      "age": "",
      "recommendationDetails": "",
      "resourceType": "",
      "region": "",
      "size": "",
      "status": "",
      "savings": "",
      "savingsCurrency": "",
      "lookbackPeriod": "",
      "service": ""
    }

    result << entry
  end

  return result
end

def aws_reserved_instance_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "region": "",
      "service": "",
      "savingsCurrency": "",
      "savings": "",
      "scope": "",
      "averageNormalizedUnitsUsedPerHour": "",
      "averageNumberOfInstancesUsedPerHour": "",
      "averageUtilization": "",
      "databaseEdition": "",
      "databaseEngine": "",
      "deploymentOption": "",
      "estimatedBreakEvenInMonths": "",
      "estimatedMonthlyOnDemandCost": "",
      "estimatedMonthlySavingsPercentage": "",
      "estimatedReservationCostForLookbackPeriod": "",
      "family": "",
      "instanceClass": "",
      "instanceSize": "",
      "instanceType": "",
      "licenseModel": "",
      "lookbackPeriod": "",
      "maximumNormalizedUnitsUsedPerHour": "",
      "maximumNumberOfInstancesUsedPerHour": "",
      "minimumNormalizedUnitsUsedPerHour": "",
      "minimumNumberOfInstancesUsedPerHour": "",
      "nodeType": "",
      "paymentOption": "",
      "platform": "",
      "productDescription": "",
      "recommendedNormalizedUnitsToPurchase": "",
      "recommendedQuantity": "",
      "recurringStandardMonthlyCost": "",
      "sizeFlexEligible": "",
      "tenancy": "",
      "upfrontCost": "",
      "resourceType": "",
      "term": ""
    }

    result << entry
  end

  return result
end

def aws_rightsize_ec2_instances_underutil(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceID": "",
      "resourceName": "",
      "tags": "",
      "recommendationDetails": "",
      "resourceType": "",
      "newResourceType": "",
      "region": "",
      "platform": "",
      "hostname": "",
      "savings": "",
      "savingsCurrency": "",
      "launchTime": "",
      "cpu_maximum": "",
      "cpu_minimum": "",
      "cpu_average": "",
      "cpu_p99": "",
      "cpu_p95": "",
      "cpu_p90": "",
      "mem_maximum": "",
      "mem_minimum": "",
      "mem_average": "",
      "mem_p99": "",
      "mem_p95": "",
      "mem_p90": "",
      "thresholdType": "",
      "threshold": "",
      "memoryThreshold": "",
      "lookbackPeriod": "",
      "service": ""
    }

    result << entry
  end

  return result
end

def aws_rightsize_ec2_instances_idle(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceID": "",
      "resourceName": "",
      "tags": "",
      "recommendationDetails": "",
      "resourceType": "",
      "region": "",
      "platform": "",
      "hostname": "",
      "savings": "",
      "savingsCurrency": "",
      "launchTime": "",
      "cpu_maximum": "",
      "cpu_minimum": "",
      "cpu_average": "",
      "cpu_p99": "",
      "cpu_p95": "",
      "cpu_p90": "",
      "mem_maximum": "",
      "mem_minimum": "",
      "mem_average": "",
      "mem_p99": "",
      "mem_p95": "",
      "mem_p90": "",
      "thresholdType": "",
      "threshold": "",
      "memoryThreshold": "",
      "lookbackPeriod": "",
      "service": ""
    }

    result << entry
  end

  return result
end

def aws_rightsize_rds_instance_underutil(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceID": "",
      "resourceName": "",
      "tags": "",
      "recommendationDetails": "",
      "region": "",
      "availabilityZone": "",
      "state": "",
      "savings": "",
      "savingsCurrency": "",
      "privateDnsName": "",
      "resourceType": "",
      "newResourceType": "",
      "cpuMaximum": "",
      "cpuMinimum": "",
      "cpuAverage": "",
      "cpuP99": "",
      "cpuP95": "",
      "cpuP90": "",
      "databaseEngine": "",
      "engineVersion": "",
      "vcpus": "",
      "licenseModel": "",
      "arn": "",
      "platform": "",
      "service": "",
      "lookbackPeriod": ""
    }

    result << entry
  end

  return result
end

def aws_rightsize_rds_instances_idle(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceID": "",
      "resourceName": "",
      "tags": "",
      "recommendationDetails": "",
      "region": "",
      "availabilityZone": "",
      "state": "",
      "savings": "",
      "savingsCurrency": "",
      "privateDnsName": "",
      "resourceType": "",
      "databaseEngine": "",
      "engineVersion": "",
      "vcpus": "",
      "licenseModel": "",
      "arn": "",
      "platform": "",
      "service": "",
      "lookbackPeriod": ""
    }

    result << entry
  end

  return result
end

def aws_savings_plan_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "region": "",
      "service": "",
      "savingsCurrency": "",
      "savings": "",
      "estimatedSavingsPercentage": "",
      "estimatedSavingsPlanCost": "",
      "lookbackPeriod": "",
      "paymentOption": "",
      "recommendedQuantity": "",
      "upfrontCost": "",
      "currentAverageHourlyOnDemandSpend": "",
      "currentMaximumHourlyOnDemandSpend": "",
      "currentMinimumHourlyOnDemandSpend": "",
      "offeringId": "",
      "instanceFamily": "",
      "resourceType": "",
      "term": ""
    }

    result << entry
  end

  return result
end

def aws_unused_ip_addresses(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceID": "",
      "ipAddress": "",
      "resourceName": "",
      "resourceType": "",
      "recommendationDetails": "",
      "age": "",
      "region": "",
      "tags": "",
      "allocationID": "",
      "savings": "",
      "savingsCurrency": "",
      "service": "",
      "domain": "",
      "lookbackPeriod": ""
    }

    result << entry
  end

  return result
end

def azure_compute_rightsizing_underutil_data(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceGroup": "",
      "resourceName": "",
      "resourceID": "",
      "tags": "",
      "recommendationDetails": "",
      "resourceType": "",
      "newResourceType": "",
      "resourceKind": "",
      "region": "",
      "osType": "",
      "savings": "",
      "savingsCurrency": "",
      "cpu_maximum": "",
      "cpu_minimum": "",
      "cpu_average": "",
      "mem_maximum": "",
      "mem_minimum": "",
      "mem_average": "",
      "thresholdType": "",
      "threshold": "",
      "memoryThreshold": "",
      "lookbackPeriod": "",
      "service": ""
    }

    result << entry
  end

  return result
end

def azure_compute_rightsizing_idle_data(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceGroup": "",
      "resourceName": "",
      "resourceID": "",
      "tags": "",
      "recommendationDetails": "",
      "resourceType": "",
      "resourceKind": "",
      "region": "",
      "osType": "",
      "savings": "",
      "savingsCurrency": "",
      "cpu_maximum": "",
      "cpu_minimum": "",
      "cpu_average": "",
      "mem_maximum": "",
      "mem_minimum": "",
      "mem_average": "",
      "thresholdType": "",
      "threshold": "",
      "memoryThreshold": "",
      "lookbackPeriod": "",
      "service": ""
    }

    result << entry
  end

  return result
end

def azure_delete_old_snapshots_data(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceGroup": "",
      "resourceName": "",
      "tags": "",
      "age": "",
      "size": "",
      "service": "",
      "region": "",
      "recommendationDetails": "",
      "savings": "",
      "savingsCurrency": "",
      "resourceType": "",
      "lookbackPeriod": "",
      "resourceID": ""
    }

    result << entry
  end

  return result
end

def azure_reserved_instance_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "service": "",
      "resourceType": "",
      "region": "",
      "term": "",
      "recommendedQuantity": "",
      "savingsCurrency": "",
      "costWithNoRI": "",
      "totalCostWithRI": "",
      "savings": "",
      "firstUsageDate": "",
      "id": "",
      "scope": "",
      "instanceFlexibilityGroup": "",
      "instanceFlexibilityRatio": "",
      "normalizedSize": "",
      "recommendedQuantityNormalized": "",
      "lookbackPeriod": ""
    }

    result << entry
  end

  return result
end

def azure_rightsize_sql_instances_downsize(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceGroup": "",
      "resourceName": "",
      "tags": "",
      "createdTime": "",
      "recommendationDetails": "",
      "newResourceType": "",
      "resourceType": "",
      "resourceKind": "",
      "region": "",
      "savings": "",
      "savingsCurrency": "",
      "cpuAverage": "",
      "service": "",
      "platform": "",
      "id": "",
      "threshold": "",
      "lookbackPeriod": "",
      "sku": {
        "name": "",
        "tier": "",
        "capacity": ""
      }
    }

    result << entry
  end

  return result
end

def azure_rightsize_sql_instances_unused(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceGroup": "",
      "resourceName": "",
      "tags": "",
      "createdTime": "",
      "recommendationDetails": "",
      "resourceType": "",
      "resourceKind": "",
      "region": "",
      "savings": "",
      "savingsCurrency": "",
      "service": "",
      "platform": "",
      "id": "",
      "lookbackPeriod": "",
      "sku": {
        "name": "",
        "tier": "",
        "capacity": ""
      }
    }

    result << entry
  end

  return result
end

def azure_savings_plan_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "name": "",
      "resourceType": "",
      "term": "",
      "recommendedQuantity": "",
      "savingsCurrency": "",
      "costWithoutBenefit": "",
      "totalCost": "",
      "savings": "",
      "savingsPercentage": "",
      "totalHours": "",
      "benefitCost": "",
      "wastageCost": "",
      "overageCost": "",
      "coveragePercentage": "",
      "commitmentGranularity": "",
      "scope": "",
      "id": "",
      "lookbackPeriod": ""
    }

    result << entry
  end

  return result
end

def azure_unused_ip_addresses(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceGroup": "",
      "ipAddress": "",
      "resourceName": "",
      "resourceType": "",
      "recommendationDetails": "",
      "age": "",
      "region": "",
      "allocation": "",
      "tags": "",
      "savings": "",
      "savingsCurrency": "",
      "service": "",
      "lookbackPeriod": "",
      "resourceID": ""
    }

    result << entry
  end

  return result
end

def azure_unused_volumes(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "resourceGroup": "",
      "resourceName": "",
      "tags": "",
      "age": "",
      "timeCreated": "",
      "recommendationDetails": "",
      "resourceType": "",
      "region": "",
      "size": "",
      "state": "",
      "savings": "",
      "savingsCurrency": "",
      "attached_vm": "",
      "service": "",
      "resourceID": "",
      "lookbackPeriod": ""
    }

    result << entry
  end

  return result
end

def google_committed_use_discount_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "projectNumber": "",
      "resourceID": "",
      "resourceName": "",
      "resourceType": "",
      "resourcesToPurchase": "",
      "region": "",
      "term": "",
      "algorithm": "",
      "recommendationDetails": "",
      "savings": "",
      "savingsCurrency": "",
      "priority": "",
      "scope": "",
      "state": ""
    }

    result << entry
  end

  return result
end

def google_idle_ip_address_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "projectNumber": "",
      "ipAddress": "",
      "resourceID": "",
      "resourceName": "",
      "resourceType": "",
      "region": "",
      "primaryImpactCategory": "",
      "tags": "",
      "service": "",
      "savings": "",
      "savingsCurrency": "",
      "priority": "",
      "recommendationDetails": "",
      "recommenderSubtype": "",
      "state": "",
      "status": "",
      "selfLink": ""
    }

    result << entry
  end

  return result
end

def google_idle_persistent_disk_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "projectNumber": "",
      "resourceID": "",
      "resourceName": "",
      "resourceType": "",
      "zone": "",
      "region": "",
      "primaryImpactCategory": "",
      "tags": "",
      "creationTime": "",
      "days_unattached": "",
      "age": "",
      "size": "",
      "savings": "",
      "savingsCurrency": "",
      "priority": "",
      "recommendationDetails": "",
      "recommenderSubtype": "",
      "state": "",
      "status": "",
      "service": "",
      "selfLink": ""
    }

    result << entry
  end

  return result
end

def google_rightsize_vm_recommendations_underutil(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "projectNumber": "",
      "resourceID": "",
      "resourceName": "",
      "resourceType": "",
      "newResourceType": "",
      "zone": "",
      "region": "",
      "hostname": "",
      "platform": "",
      "cpuMaximum": "",
      "cpuMinimum": "",
      "cpuAverage": "",
      "primaryImpactCategory": "",
      "tags": "",
      "service": "",
      "savings": "",
      "savingsCurrency": "",
      "priority": "",
      "recommendationDetails": "",
      "recommenderSubtype": "",
      "state": "",
      "status": "",
      "selfLink": ""
    }

    result << entry
  end

  return result
end

def google_rightsize_vm_recommendations_idle(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "projectNumber": "",
      "resourceID": "",
      "resourceName": "",
      "resourceType": "",
      "zone": "",
      "region": "",
      "hostname": "",
      "platform": "",
      "cpuMaximum": "",
      "cpuMinimum": "",
      "cpuAverage": "",
      "primaryImpactCategory": "",
      "tags": "",
      "service": "",
      "savings": "",
      "savingsCurrency": "",
      "priority": "",
      "recommendationDetails": "",
      "recommenderSubtype": "",
      "state": "",
      "status": "",
      "selfLink": ""
    }

    result << entry
  end

  return result
end

def google_sql_idle_instance_recommendations(iterations = 50)
  result = []

  for iteration in 1..iterations do
    entry = {
      "accountID": "",
      "accountName": "",
      "projectNumber": "",
      "resourceID": "",
      "resourceType": "",
      "region": "",
      "timeCreated": "",
      "primaryImpactCategory": "",
      "tags": "",
      "service": "",
      "pricingPlan": "",
      "savings": "",
      "savingsCurrency": "",
      "priority": "",
      "recommendationDetails": "",
      "recommenderSubtype": "",
      "platform": "",
      "diskType": "",
      "size": "",
      "availabilityType": "",
      "replicationType": "",
      "state": "",
      "status": "",
      "resourceName": "",
      "selfLink": ""
    }

    result << entry
  end

  return result
end

###############################################################################
# Write Demo Files
###############################################################################

write_demo_data(aws_delete_old_snapshots, "./flexera/data/aws/aws_delete_old_snapshots.json")
write_demo_data(aws_delete_unused_volumes, "./flexera/data/aws/aws_delete_unused_volumes.json")
write_demo_data(aws_reserved_instance_recommendations, "./flexera/data/aws/aws_reserved_instance_recommendations.json")
write_demo_data(aws_rightsize_ec2_instances_underutil, "./flexera/data/aws/aws_rightsize_ec2_instances_underutil.json")
write_demo_data(aws_rightsize_ec2_instances_idle, "./flexera/data/aws/aws_rightsize_ec2_instances_idle.json")
write_demo_data(aws_rightsize_rds_instance_underutil, "./flexera/data/aws/aws_rightsize_rds_instance_underutil.json")
write_demo_data(aws_rightsize_rds_instances_idle, "./flexera/data/aws/aws_rightsize_rds_instances_idle.json")
write_demo_data(aws_savings_plan_recommendations, "./flexera/data/aws/aws_savings_plan_recommendations.json")
write_demo_data(aws_unused_ip_addresses, "./flexera/data/aws/aws_unused_ip_addresses.json")
write_demo_data(azure_compute_rightsizing_underutil_data, "./flexera/data/azure/azure_compute_rightsizing_underutil_data.json")
write_demo_data(azure_compute_rightsizing_idle_data, "./flexera/data/azure/azure_compute_rightsizing_idle_data.json")
write_demo_data(azure_delete_old_snapshots_data, "./flexera/data/azure/azure_delete_old_snapshots_data.json")
write_demo_data(azure_reserved_instance_recommendations, "./flexera/data/azure/azure_reserved_instance_recommendations.json")
write_demo_data(azure_rightsize_sql_instances_downsize, "./flexera/data/azure/azure_rightsize_sql_instances_downsize.json")
write_demo_data(azure_rightsize_sql_instances_unused, "./flexera/data/azure/azure_rightsize_sql_instances_unused.json")
write_demo_data(azure_savings_plan_recommendations, "./flexera/data/azure/azure_savings_plan_recommendations.json")
write_demo_data(azure_unused_ip_addresses, "./flexera/data/azure/azure_unused_ip_addresses.json")
write_demo_data(azure_unused_volumes, "./flexera/data/azure/azure_unused_volumes.json")
write_demo_data(google_committed_use_discount_recommendations, "./flexera/data/google/google_committed_use_discount_recommendations.json")
write_demo_data(google_idle_ip_address_recommendations, "./flexera/data/google/google_idle_ip_address_recommendations.json")
write_demo_data(google_idle_persistent_disk_recommendations, "./flexera/data/google/google_idle_persistent_disk_recommendations.json")
write_demo_data(google_rightsize_vm_recommendations_underutil, "./flexera/data/google/google_rightsize_vm_recommendations_underutil.json")
write_demo_data(google_rightsize_vm_recommendations_idle, "./flexera/data/google/google_rightsize_vm_recommendations_idle.json")
write_demo_data(google_sql_idle_instance_recommendations, "./flexera/data/google/google_sql_idle_instance_recommendations.json")
