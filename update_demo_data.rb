# Update Demo Data
# This script updates the demo data.

###############################################################################
# Required Libraries
###############################################################################

require 'uri'
require 'json'
require 'time'

###############################################################################
# Global Variables/Settings
###############################################################################

# Default number of recommendations to produce for each policy
$default_iterations = 50

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

  return azure_db_sku_list.sample
end

def get_random_azure_db_sku
  azure_db_sku_list = [
    { "name": "Standard", "tier": "Standard" },
    { "name": "Standard", "tier": "Standard" },
    { "name": "Standard", "tier": "Standard" },
    { "name": "Premium", "tier": "Premium" },
    { "name": "DataWarehouse", "tier": "DataWarehouse" },
    { "name": "GP_Gen4", "tier": "GeneralPurpose" },
    { "name": "GP_Gen5", "tier": "GeneralPurpose" },
    { "name": "GP_Gen5", "tier": "GeneralPurpose" },
    { "name": "GP_Gen5", "tier": "GeneralPurpose" },
    { "name": "HS_Gen5", "tier": "Hyperscale" },
    { "name": "BC_Gen5", "tier": "BusinessCritical" }
  ]

  return azure_db_sku_list.sample
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

def get_random_google_compute_platform
  google_compute_platform_list = [
    "Intel Skylake",
    "Intel Cascade Lake",
    "Intel Haswell",
    "Intel Sandy Bridge",
    "AMD Rome"
  ]

  return google_compute_platform_list.sample
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

def get_random_google_zone(region)
  case rand(1..3)
  when 1
    zone = region + "-a"
  when 2
    zone = region + "-b"
  when 3
    zone = region + "-c"
  end

  return zone
end

def get_random_google_db_version
  google_db_version_list = [
    "MYSQL_5_6",
    "MYSQL_5_7",
    "MYSQL_8_0_28",
    "MYSQL_8_0_30",
    "MYSQL_8_0_33",
    "MYSQL_8_0_36",
    "SQLSERVER_2017_STANDARD",
    "SQLSERVER_2022_STANDARD",
    "POSTGRES_13",
    "POSTGRES_14",
    "POSTGRES_15"
  ]

  return google_db_version_list.sample
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
    "environment=staging, app=crmModule",
    "environment=prod, app=customerSupport, team=security, tier=web",
    "environment=dev, app=reportingService, tier=web",
    "environment=test, app=billingService, team=backend",
    "environment=qa, app=customerSupport, tier=application",
    "environment=staging, app=invoiceProcessing",
    "environment=prod, app=securityModule",
    "environment=test, app=dataWarehouse",
    "environment=staging, app=dataAnalytics, team=backend, tier=web",
    "environment=prod, app=userManagement",
    "environment=dev, app=securityModule, team=infra",
    "environment=dev, app=customerSupport, tier=application",
    "environment=prod, app=reportingService, team=backend, tier=web",
    "environment=test, app=paymentGateway, tier=application"
  ]

  return tag_list.sample
end

def get_random_name
  adjectives = [
    "quick", "lazy", "drowsy", "excited", "adventurous", "jolly", "brave", "calm",
    "eager", "fierce", "gentle", "happy", "innocent", "jovial", "kind", "lively",
    "merry", "nervous", "obedient", "proud", "relieved", "silly", "thankful",
    "upbeat", "vivacious", "witty", "excited", "youthful", "zealous", "quirky",
    "red", "large", "rotund", "small", "blue", "green", "yellow", "oval", "square",
    "rectangular", "circular", "tall", "short", "massive", "tiny", "gigantic",
    "purple", "orange", "black", "white", "thin", "wide", "narrow", "flat", "round",
    "cylindrical", "spherical", "elliptical", "bright", "dark", "vibrant", "dull",
    "shiny", "matte", "translucent", "transparent", "opaque", "metallic",
    "fluorescent", "glossy"
  ]

  nouns = [
    "ant", "bear", "cat", "dog", "eel", "fox", "goat", "horse", "ibis", "jaguar",
    "kangaroo", "lion", "mouse", "newt", "owl", "penguin", "quail", "rabbit",
    "snake", "tiger", "urchin", "viper", "whale", "xerus", "yak", "zebra", "parrot",
    "octopus", "giraffe", "elephant", "apple", "banana", "aubergine", "orange",
    "strawberry", "grape", "mango", "peach", "pear", "watermelon", "tomato",
    "cucumber", "carrot", "lettuce", "broccoli", "spinach", "potato", "onion",
    "garlic", "pepper", "zucchini", "corn", "pineapple", "kiwi", "lemon", "lime",
    "blueberry", "raspberry", "blackberry", "cherry", "melon", "papaya", "plum",
    "pomegranate", "avocado", "coconut", "grapefruit", "kale", "mushroom", "olive",
    "peas", "pumpkin", "radish", "yam", "turnip", "Eris", "Jupiter",
    "Phobos", "Mars", "Venus", "Saturn", "Mercury", "Neptune", "Uranus", "Pluto",
    "Earth", "Moon", "Sun", "Callisto", "Europa", "Ganymede", "Io", "Titan",
    "Iapetus", "Dione", "Triton", "Charon", "Ceres", "Pallas", "Vesta", "Hygiea",
    "Orcus", "Haumea", "Makemake", "Sedna", "Quaoar", "Gonggong", "Eunomia", "Juno",
    "Psyche", "Chiron", "Chariklo", "Eris", "Nessus"
  ]

  return "#{adjectives.sample}#{nouns.sample}".downcase
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

def get_random_string(length = 26, casing = "upper")
  characters = ('A'..'Z').to_a + ('0'..'9').to_a if casing == "upper"
  characters = ('a'..'z').to_a + ('0'..'9').to_a if casing == "lower"
  characters = ('A'..'Z').to_a + ('a'..'z').to_a + ('0'..'9').to_a if casing == "all"

  return (0...length).map { characters.sample }.join
end

def get_random_hex_string(length = 17)
  hex_string = ''
  number_of_bytes = (length + 1) / 2

  number_of_bytes.times do
    hex_string << rand(0..255).to_s(16).rjust(2, '0')
  end

  return hex_string[0...length]
end

def get_random_ip_address
  return rand(11..240).to_s + "." + rand(11..240).to_s + "." + rand(11..240).to_s + "." + rand(11..240).to_s
end

def get_random_savings(minimum = 1, maximum = 1000)
  return rand(minimum..maximum) + (rand(1..99).to_f / 100)
end

def get_currency
  return "US$"
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

def aws_delete_old_snapshots(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_aws_account
    accountName = get_random_name
    resourceID = get_random_name
    service = "EC2"

    recommendationDetails = [
      "Delete ", service, " snapshot ", resourceID, " ",
      "in AWS Account ", accountName, " (", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceID": resourceID,
      "resourceName": get_random_name,
      "tags": get_random_tags,
      "age": rand(1..200),
      "size": rand(20..500),
      "service": service,
      "recommendationDetails": recommendationDetails,
      "parentType": "EBS Volume",
      "parentId": "vol-" + get_random_hex_string,
      "snapshotType": "manual",
      "description": "",
      "resourceType": "Storage Snapshot",
      "imageId": "",
      "region": get_random_aws_region,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "lookbackPeriod": 30,
      "policy_name": "AWS Old Snapshots"
    }

    result << entry
  end

  return result
end

def aws_delete_unused_volumes(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_aws_account
    accountName = get_random_name
    resourceID = "vol-" + get_random_hex_string

    recommendationDetails = [
      "Delete volume ", resourceID, " ",
      "in AWS Account ", accountName, " ",
      "(", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceID": resourceID,
      "resourceName": get_random_name,
      "tags": get_random_tags,
      "age": rand(1..200),
      "recommendationDetails": recommendationDetails,
      "resourceType": "gp" + rand(2..3).to_s,
      "region": get_random_aws_region,
      "size": rand(20..500),
      "status": "available",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "lookbackPeriod": 30,
      "service": "EBS",
      "policy_name": "AWS Unused Volumes"
    }

    result << entry
  end

  return result
end

def aws_reserved_instance_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    instanceType = get_random_aws_ec2_size[rand(0..2)]
    resourceType = instanceType.split('.')[0]

    entry = {
      "accountID": get_random_aws_account,
      "accountName": get_random_name,
      "region": get_random_aws_region,
      "service": "Elastic Compute Cloud (EC2)",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "scope": "Linked",
      "averageNormalizedUnitsUsedPerHour": rand(1..1000) + (rand(1..99).to_f / 100),
      "averageNumberOfInstancesUsedPerHour": rand(1..1000) + (rand(1..99).to_f / 100),
      "averageUtilization": rand(1..100),
      "databaseEdition": "",
      "databaseEngine": "",
      "deploymentOption": "",
      "estimatedBreakEvenInMonths": rand(1..100) + (rand(1..99).to_f / 100),
      "estimatedMonthlyOnDemandCost": rand(1..1000) + (rand(1..99).to_f / 100),
      "estimatedMonthlySavingsPercentage": rand(1..90),
      "estimatedReservationCostForLookbackPeriod": rand(1..100) + (rand(1..99).to_f / 100),
      "family": "",
      "instanceClass": "",
      "instanceSize": "",
      "instanceType": instanceType,
      "licenseModel": "",
      "lookbackPeriod": 7,
      "maximumNormalizedUnitsUsedPerHour": rand(1..100) + (rand(1..99).to_f / 100),
      "maximumNumberOfInstancesUsedPerHour": rand(1..100) + (rand(1..99).to_f / 100),
      "minimumNormalizedUnitsUsedPerHour": rand(1..100) + (rand(1..99).to_f / 100),
      "minimumNumberOfInstancesUsedPerHour": rand(1..100) + (rand(1..99).to_f / 100),
      "nodeType": instanceType,
      "paymentOption": "Partial_Upfront",
      "platform": "",
      "productDescription": "Linux/UNIX",
      "recommendedNormalizedUnitsToPurchase": rand(1..10),
      "recommendedQuantity": rand(1..10),
      "recurringStandardMonthlyCost": rand(1..1000) + (rand(1..99).to_f / 100),
      "sizeFlexEligible": "false",
      "tenancy": "Shared",
      "upfrontCost": rand(1..1000) + (rand(1..99).to_f / 100),
      "resourceType": resourceType,
      "term": "1 year",
      "policy_name": "AWS Reserved Instances Recommendations"
    }

    result << entry
  end

  return result
end

def aws_rightsize_ec2_instances_underutil(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_aws_account
    accountName = get_random_name
    resourceID = "i-" + get_random_hex_string

    type = get_random_aws_ec2_size
    resourceType = type[0]
    newResourceType = type[1]

    recommendationDetails = [
      "Change instance type of EC2 instance ", resourceID, " ",
      "in AWS Account ", accountName, " ",
      "(", accountID, ") ",
      "from ", resourceType, " ",
      "to ", newResourceType
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceID": resourceID,
      "resourceName": get_random_name,
      "tags": get_random_tags,
      "recommendationDetails": recommendationDetails,
      "resourceType": resourceType,
      "newResourceType": newResourceType,
      "region": get_random_aws_region,
      "platform": "Linux/UNIX",
      "hostname": get_random_ip_address,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "launchTime": get_random_date(rand((Time.now.year - 4)..(Time.now.year - 1))),
      "cpu_maximum": rand(60..99) + (rand(1..99).to_f / 100),
      "cpu_minimum": rand(1..10) + (rand(1..99).to_f / 100),
      "cpu_average": rand(11..39) + (rand(1..99).to_f / 100),
      "cpu_p99": rand(60..99) + (rand(1..99).to_f / 100),
      "cpu_p95": rand(1..10) + (rand(1..99).to_f / 100),
      "cpu_p90": rand(11..39) + (rand(1..99).to_f / 100),
      "mem_maximum": rand(60..99) + (rand(1..99).to_f / 100),
      "mem_minimum": rand(1..10) + (rand(1..99).to_f / 100),
      "mem_average": rand(11..39) + (rand(1..99).to_f / 100),
      "mem_p99": rand(60..99) + (rand(1..99).to_f / 100),
      "mem_p95": rand(1..10) + (rand(1..99).to_f / 100),
      "mem_p90": rand(11..39) + (rand(1..99).to_f / 100),
      "thresholdType": "Average",
      "threshold": 40,
      "memoryThreshold": 40,
      "lookbackPeriod": 30,
      "service": "EC2",
      "policy_name": "AWS Rightsize EC2 Instances"
    }

    result << entry
  end

  return result
end

def aws_rightsize_ec2_instances_idle(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_aws_account
    accountName = get_random_name
    resourceID = "i-" + get_random_hex_string

    recommendationDetails = [
      "Terminate EC2 instance ", resourceID, " ",
      "in AWS Account ", accountName, " ",
      "(", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceID": resourceID,
      "resourceName": get_random_name,
      "tags": get_random_tags,
      "recommendationDetails": recommendationDetails,
      "resourceType": get_random_aws_ec2_size[rand(0..2)],
      "region": get_random_aws_region,
      "platform": "Linux/UNIX",
      "hostname": get_random_ip_address,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "launchTime": get_random_date(rand((Time.now.year - 4)..(Time.now.year - 1))),
      "cpu_maximum": rand(5..20) + (rand(1..99).to_f / 100),
      "cpu_minimum": rand(1..2) + (rand(1..99).to_f / 100),
      "cpu_average": rand(3..4) + (rand(1..99).to_f / 100),
      "cpu_p99": rand(5..20) + (rand(1..99).to_f / 100),
      "cpu_p95": rand(1..2) + (rand(1..99).to_f / 100),
      "cpu_p90": rand(3..4) + (rand(1..99).to_f / 100),
      "mem_maximum": rand(5..20) + (rand(1..99).to_f / 100),
      "mem_minimum": rand(1..2) + (rand(1..99).to_f / 100),
      "mem_average": rand(3..4) + (rand(1..99).to_f / 100),
      "mem_p99": rand(5..20) + (rand(1..99).to_f / 100),
      "mem_p95": rand(1..2) + (rand(1..99).to_f / 100),
      "mem_p90": rand(3..4) + (rand(1..99).to_f / 100),
      "thresholdType": "Average",
      "threshold": 5,
      "memoryThreshold": 5,
      "lookbackPeriod": 30,
      "service": "EC2",
      "policy_name": "AWS Rightsize EC2 Instances"
    }

    result << entry
  end

  return result
end

def aws_rightsize_rds_instance_underutil(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_aws_account
    accountName = get_random_name
    region = get_random_aws_region
    resourceName = get_random_name
    resourceID = "db-" + get_random_string

    type = get_random_aws_ec2_size
    resourceType = "db." + type[0]
    newResourceType = "db." + type[1]

    arn = "arn:aws:rds:" + region + ":" + accountID + ":" + resourceName

    recommendationDetails = [
      "Downsize AWS RDS instance ", resourceName, " ",
      "in AWS Account ", accountName, " ",
      "(", accountID, ") ",
      "from ", resourceType, " ",
      "to ", newResourceType
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceID": resourceID,
      "resourceName": resourceName,
      "tags": get_random_tags,
      "recommendationDetails": recommendationDetails,
      "region": region,
      "availabilityZone": region + "a",
      "state": "",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "privateDnsName": "",
      "resourceType": resourceType,
      "newResourceType": newResourceType,
      "cpuMaximum": rand(60..99) + (rand(1..99).to_f / 100),
      "cpuMinimum": rand(1..10) + (rand(1..99).to_f / 100),
      "cpuAverage": rand(11..39) + (rand(1..99).to_f / 100),
      "cpuP99": rand(60..99) + (rand(1..99).to_f / 100),
      "cpuP95": rand(1..10) + (rand(1..99).to_f / 100),
      "cpuP90": rand(11..39) + (rand(1..99).to_f / 100),
      "databaseEngine": "aurora-postgresql",
      "engineVersion": rand(2..9),
      "vcpus": 2**rand(0..5),
      "licenseModel": "",
      "arn": arn,
      "platform": "aurora-postgresql",
      "service": "AmazonRDS",
      "lookbackPeriod": 30,
      "policy_name": "AWS Rightsize RDS Instances"
    }

    result << entry
  end

  return result
end

def aws_rightsize_rds_instances_idle(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_aws_account
    accountName = get_random_name
    region = get_random_aws_region
    type = get_random_aws_ec2_size
    resourceName = get_random_name
    resourceID = "db-" + get_random_string

    arn = "arn:aws:rds:" + region + ":" + accountID + ":" + resourceName

    recommendationDetails = [
      "Terminate RDS instance ", resourceName, " ",
      "in AWS Account ", accountName, " (", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceID": resourceID,
      "resourceName": resourceName,
      "tags": get_random_tags,
      "recommendationDetails": recommendationDetails,
      "region": region,
      "availabilityZone": region + "a",
      "state": "",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "privateDnsName": "",
      "resourceType": "db." + type[0],
      "databaseEngine": "aurora-postgresql",
      "engineVersion": rand(2..9),
      "vcpus": 2**rand(0..5),
      "licenseModel": "",
      "arn": arn,
      "platform": "aurora-postgresql",
      "service": "AmazonRDS",
      "lookbackPeriod": 30,
      "policy_name": "AWS Rightsize RDS Instances"
    }

    result << entry
  end

  return result
end

def aws_savings_plan_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    offeringId = get_random_string(9, "lower") + '-' + get_random_string(4, "lower") + '-' + get_random_string(4, "lower") + '-' + get_random_string(4, "lower") + '-' + get_random_string(11, "lower")

    entry = {
      "accountID": get_random_aws_account,
      "accountName": get_random_name,
      "region": get_random_aws_region,
      "service": "Elastic Compute Cloud (EC2)",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "estimatedSavingsPercentage": rand(1..90),
      "estimatedSavingsPlanCost": rand(1..1000) + (rand(1..99).to_f / 100),
      "lookbackPeriod": 7,
      "paymentOption": "No Upfront",
      "recommendedQuantity": rand(1..10),
      "upfrontCost": 0,
      "currentAverageHourlyOnDemandSpend": rand(30..49) + (rand(1..99).to_f / 100),
      "currentMaximumHourlyOnDemandSpend": rand(50..99) + (rand(1..99).to_f / 100),
      "currentMinimumHourlyOnDemandSpend": rand(1..29) + (rand(1..99).to_f / 100),
      "offeringId": offeringId,
      "instanceFamily": "",
      "resourceType": "Compute Savings Plan",
      "term": "1 year",
      "policy_name": "AWS Savings Plan Recommendations"
    }

    result << entry
  end

  return result
end

def aws_unused_ip_addresses(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_aws_account
    accountName = get_random_name
    region = get_random_aws_region
    resourceID = get_random_ip_address
    ipAddress = get_random_ip_address
    resourceName = get_random_name + '/' + get_random_string(4, "lower")
    allocationID = "eipalloc-" + rand(10000000..99999999).to_s

    recommendationDetails = [
      "Release IP address ", resourceID, " ",
      "in AWS Account ", accountName, " (", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceID": resourceID,
      "ipAddress": ipAddress,
      "resourceName": resourceName,
      "resourceType": "IP Address",
      "recommendationDetails": recommendationDetails,
      "age": rand(1..80),
      "region": region,
      "tags": get_random_tags,
      "allocationID": allocationID,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "service": "EC2",
      "domain": "standard",
      "lookbackPeriod": 30,
      "policy_name": "AWS Unused IP Addresses"
    }

    result << entry
  end

  return result
end

def azure_compute_rightsizing_underutil_data(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceGroup = get_random_name
    resourceName = get_random_name
    resourceId = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/virtualMachines/" + resourceName

    type = get_random_azure_compute_size
    resourceType = type[0]
    newResourceType = type[1]

    recommendationDetails = [
      "Resize Azure virtual machine ", resourceName, " ",
      "in Azure Subscription ", accountName, " ",
      "(", accountID, ") ",
      "from ", resourceType, " to ", newResourceType
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceGroup": resourceGroup,
      "resourceName": resourceName,
      "resourceID": resourceId,
      "tags": get_random_tags,
      "recommendationDetails": recommendationDetails,
      "resourceType": resourceType,
      "newResourceType": newResourceType,
      "resourceKind": "Microsoft.Compute/virtualMachines",
      "region": get_random_azure_region,
      "osType": "Linux",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "cpu_maximum": rand(60..99) + (rand(1..99).to_f / 100),
      "cpu_minimum": rand(1..10) + (rand(1..99).to_f / 100),
      "cpu_average": rand(11..39) + (rand(1..99).to_f / 100),
      "mem_maximum": rand(60..99) + (rand(1..99).to_f / 100),
      "mem_minimum": rand(1..10) + (rand(1..99).to_f / 100),
      "mem_average": rand(11..39) + (rand(1..99).to_f / 100),
      "thresholdType": "Average",
      "threshold": 40,
      "memoryThreshold": 40,
      "lookbackPeriod": 30,
      "service": "Microsoft.Compute",
      "policy_name": "Azure Rightsize Compute Instances"
    }

    result << entry
  end

  return result
end

def azure_compute_rightsizing_idle_data(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceGroup = get_random_name
    resourceName = get_random_name
    resourceId = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/virtualMachines/" + resourceName
    resourceType = get_random_azure_compute_size[rand(0..1)]

    recommendationDetails = [
      "Delete Azure virtual machine ", resourceName, " ",
      "in Azure Subscription ", accountName, " ",
      "(", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceGroup": resourceGroup,
      "resourceName": resourceName,
      "resourceID": resourceId,
      "tags": get_random_tags,
      "recommendationDetails": recommendationDetails,
      "resourceType": resourceType,
      "resourceKind": "Microsoft.Compute/virtualMachines",
      "region": get_random_azure_region,
      "osType": "Linux",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "cpu_maximum": rand(5..20) + (rand(1..99).to_f / 100),
      "cpu_minimum": rand(1..2) + (rand(1..99).to_f / 100),
      "cpu_average": rand(3..4) + (rand(1..99).to_f / 100),
      "mem_maximum": rand(5..20) + (rand(1..99).to_f / 100),
      "mem_minimum": rand(1..2) + (rand(1..99).to_f / 100),
      "mem_average": rand(3..4) + (rand(1..99).to_f / 100),
      "thresholdType": "Average",
      "threshold": 5,
      "memoryThreshold": 5,
      "lookbackPeriod": 30,
      "service": "Microsoft.Compute",
      "policy_name": "Azure Rightsize Compute Instances"
    }

    result << entry
  end

  return result
end

def azure_delete_old_snapshots_data(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceGroup = get_random_name
    resourceName = get_random_name
    resourceId = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/snapshots/" + resourceName

    recommendationDetails = [
      "Delete Azure snapshot ", resourceName, " ",
      "in Azure Subscription ", accountName,
      " (", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceGroup": resourceGroup,
      "resourceName": resourceName,
      "tags": get_random_tags,
      "age": rand(30..360),
      "size": rand(2..500),
      "service": "Microsoft.Compute",
      "region": get_random_azure_region,
      "recommendationDetails": recommendationDetails,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "resourceType": "Microsoft.Compute/snapshots",
      "lookbackPeriod": 30,
      "resourceID": resourceId,
      "policy_name": "Azure Old Snapshots"
    }

    result << entry
  end

  return result
end

def azure_reserved_instance_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceType = get_random_azure_compute_size[rand(0..1)]
    recommendedQuantity = rand(1..10)

    totalCostWithRI = get_random_savings
    costWithNoRI = totalCostWithRI + get_random_savings(10, 300)
    savings = costWithNoRI - totalCostWithRI

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "service": "Microsoft.Compute",
      "resourceType": resourceType,
      "region": get_random_azure_region,
      "term": "1 Year",
      "recommendedQuantity": resourceType,
      "costWithNoRI": costWithNoRI,
      "totalCostWithRI": totalCostWithRI,
      "savings": savings,
      "savingsCurrency": get_currency,
      "firstUsageDate": get_random_date(rand((Time.now.year - 4)..(Time.now.year - 1))),
      "id": get_random_azure_meter,
      "scope": "Single",
      "instanceFlexibilityGroup": "NA",
      "instanceFlexibilityRatio": 1,
      "normalizedSize": resourceType,
      "recommendedQuantityNormalized": resourceType,
      "lookbackPeriod": "Last 7 Days",
      "policy_name": "Azure Reserved Instances Recommendations"
    }

    result << entry
  end

  return result
end

def azure_rightsize_sql_instances_downsize(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceGroup = get_random_name

    serverName = get_random_name
    dbName = get_random_name
    resourceName = serverName + "/" + dbName

    capacity = rand(500..1000)
    newResourceType = rand(10..400)

    sku = get_random_azure_db_sku

    resourceID = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Sql/servers/" + serverName + "/databases/" + dbName

    recommendationDetails = [
      "Downsize Azure SQL database ", resourceName, " ",
      "in Azure Subscription ", accountName, " ",
      "(", accountID, ") ",
      "from ", capacity, " capacity ",
      "to ", newResourceType, " capacity"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceGroup": resourceGroup,
      "resourceName": resourceName,
      "tags": get_random_tags,
      "createdTime": get_random_date(rand((Time.now.year - 4)..(Time.now.year - 1))),
      "recommendationDetails": recommendationDetails,
      "newResourceType": newResourceType,
      "resourceType": "Microsoft.Sql/servers/databases",
      "resourceKind": "v12.0,user",
      "region": get_random_azure_region,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "cpuAverage": rand(11..39) + (rand(1..99).to_f / 100),
      "service": "Microsoft.Sql/servers/databases",
      "platform": "Azure SQL Database",
      "id": resourceID,
      "threshold": 40,
      "lookbackPeriod": 30,
      "sku": {
        "name": sku[:name],
        "tier": sku[:tier],
        "capacity": capacity
      },
      "policy_name": "Azure Rightsize SQL Databases"
    }

    result << entry
  end

  return result
end

def azure_rightsize_sql_instances_unused(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceGroup = get_random_name

    serverName = get_random_name
    dbName = get_random_name
    resourceName = serverName + "/" + dbName

    resourceID = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Sql/servers/" + serverName + "/databases/" + dbName

    sku = get_random_azure_db_sku
    capacity = rand(10..1000)

    recommendationDetails = [
      "Delete Azure SQL database ", resourceName, " ",
      "in Azure Subscription ", accountName, " ",
      "(", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceGroup": resourceGroup,
      "resourceName": resourceName,
      "tags": get_random_tags,
      "createdTime": get_random_date(rand((Time.now.year - 4)..(Time.now.year - 1))),
      "recommendationDetails": recommendationDetails,
      "resourceType": "Microsoft.Sql/servers/databases",
      "resourceKind": "v12.0,user",
      "region": get_random_azure_region,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "service": "Microsoft.Sql/servers/databases",
      "platform": "Azure SQL Database",
      "id": resourceID,
      "lookbackPeriod": 30,
      "sku": {
        "name": sku[:name],
        "tier": sku[:tier],
        "capacity": capacity
      },
      "policy_name": "Azure Rightsize SQL Databases"
    }

    result << entry
  end

  return result
end

def azure_savings_plan_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    name = get_random_name + get_random_name
    sku = "SQL_" + get_random_name

    id = "/subscriptions/" + accountID + "/providers/Microsoft.CostManagement/benefitRecommendations/" + name

    recommendedQuantity = rand(1..10)

    totalCostWithSP = get_random_savings
    costWithNoSP = totalCostWithSP + get_random_savings(10, 300)
    savings = costWithNoSP - totalCostWithSP

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "name": name,
      "resourceType": sku,
      "term": "1 Year",
      "recommendedQuantity": recommendedQuantity,
      "costWithoutBenefit": costWithNoSP,
      "totalCost": totalCostWithSP,
      "savings": savings,
      "savingsCurrency": get_currency,
      "savingsPercentage": rand(5..20) + (rand(1..99).to_f / 100),
      "totalHours": 150,
      "benefitCost": 54,
      "wastageCost": 23.924,
      "overageCost": rand(1..20) + (rand(1..99).to_f / 100),
      "coveragePercentage": rand(1..50) + (rand(1..99).to_f / 100),
      "commitmentGranularity": "Hourly",
      "scope": "Single",
      "id": id,
      "lookbackPeriod": 30
    }

    result << entry
  end

  return result
end

def azure_unused_ip_addresses(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceGroup = get_random_name
    ipAddress = get_random_ip_address
    resourceName = get_random_name
    resourceId = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Network/publicIPAddresses/" + resourceName

    recommendationDetails = [
      "Delete IP address ", resourceName, " (", ipAddress, ") ",
      "in Azure Subscription ", accountName, " (", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceGroup": resourceGroup,
      "ipAddress": ipAddress,
      "resourceName": resourceName,
      "resourceType": "Microsoft.Network/publicIPAddresses",
      "recommendationDetails": recommendationDetails,
      "age": rand(30..360),
      "region": get_random_azure_region,
      "allocation": "Static",
      "tags": get_random_tags,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "service": "Microsoft.Network",
      "lookbackPeriod": 30,
      "resourceID": resourceId
    }

    result << entry
  end

  return result
end

def azure_unused_volumes(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountID = get_random_azure_account
    accountName = get_random_name
    resourceGroup = get_random_name

    resourceName = get_random_name
    resourceId = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/disks/" + resourceName

    attached_vm = "/subscriptions/" + accountID + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/virtualMachines/" + get_random_name

    recommendationDetails = [
      "Delete unused volume ", resourceName, " ",
      "in Azure Subscription ", accountName,
      " (", accountID, ")"
    ].join

    entry = {
      "accountID": accountID,
      "accountName": accountName,
      "resourceGroup": resourceGroup,
      "resourceName": resourceName,
      "tags": get_random_tags,
      "age": rand(30..360),
      "timeCreated": get_random_date(Time.now.year),
      "recommendationDetails": recommendationDetails,
      "resourceType": "Microsoft.Compute/disks",
      "region": get_random_azure_region,
      "size": rand(10..500),
      "state": "Unattached",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "attached_vm": attached_vm,
      "service": "Microsoft.Compute",
      "resourceID": resourceId,
      "lookbackPeriod": 30
    }

    result << entry
  end

  return result
end

def google_committed_use_discount_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountId = "rightscale.com:resat-prem"
    accountName = "RightScale-Resat-Premium"
    projectNumber = rand(1000000000000..9999999999999).to_s
    recommendationDetails = get_random_google_cud_description
    region = get_random_google_region
    resourceName = "cud-recommendation-" + rand(1000000000..9999999999).to_s

    resourceID = "projects/" + projectNumber + "/locations/" + region + "/recommenders/google.compute.commitment.UsageCommitmentRecommender/recommendations/" + recommendationDetails

    entry = {
      "accountID": accountId,
      "accountName": accountName,
      "projectNumber": projectNumber,
      "resourceID": resourceID,
      "resourceName": resourceName,
      "resourceType": "GENERAL_PURPOSE",
      "resourcesToPurchase": rand(1..5),
      "region": region,
      "term": "1 Year",
      "algorithm": "Optimal (Break-Even Point)",
      "recommendationDetails": recommendationDetails,
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "priority": "P4",
      "scope": "PROJECT_SCOPED_COMMITMENTS",
      "state": "ACTIVE"
    }

    result << entry
  end

  return result
end

def google_idle_ip_address_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountId = "rightscale.com:resat-prem"
    accountName = "RightScale-Resat-Premium"
    projectNumber = rand(1000000000000..9999999999999).to_s
    ipAddress = get_random_ip_address
    resourceID = rand(10000000000000000000..99999999999999999999).to_s
    resourceName = get_random_name + + "-public-ip"
    region = get_random_google_region

    selfLink = "https://www.googleapis.com/compute/v1/projects/" + accountId + "/regions/" + region + "/addresses/" + resourceName

    recommendationDetails = "Save cost by deleting idle IP address '" + resourceName + "'."

    entry = {
      "accountID": accountId,
      "accountName": accountName,
      "projectNumber": projectNumber,
      "ipAddress": ipAddress,
      "resourceID": resourceID,
      "resourceName": resourceName,
      "resourceType": "compute#address",
      "region": region,
      "primaryImpactCategory": "COST",
      "tags": get_random_tags,
      "service": "Compute Engine",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "priority": "P4",
      "recommendationDetails": recommendationDetails,
      "recommenderSubtype": "DELETE_ADDRESS",
      "state": "ACTIVE",
      "status": "RESERVED",
      "selfLink": selfLink
    }

    result << entry
  end

  return result
end

def google_idle_persistent_disk_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountId = "rightscale.com:resat-prem"
    accountName = "RightScale-Resat-Premium"
    projectNumber = rand(1000000000000..9999999999999).to_s
    region = get_random_google_region
    zone = get_random_google_zone(region)

    resourceID = rand(10000000000000000000..99999999999999999999).to_s
    resourceName = get_random_name + "-disk" + rand(1..3).to_s

    days_unattached = rand(30..120)
    age = days_unattached + rand(1..120)

    selfLink = "https://www.googleapis.com/compute/v1/projects/" + accountId + "/zones/" + zone + "/disks/" + resourceName

    recommendationDetails = "Save cost by snapshotting and then deleting idle persistent disk '" + resourceName + "'.",

    entry = {
      "accountID": accountId,
      "accountName": accountName,
      "projectNumber": projectNumber,
      "resourceID": resourceID,
      "resourceName": resourceName,
      "resourceType": "compute#disk",
      "zone": zone,
      "region": region,
      "primaryImpactCategory": "COST",
      "tags": get_random_tags,
      "creationTime": get_random_date(rand((Time.now.year - 4)..(Time.now.year - 1))),
      "days_unattached": days_unattached,
      "age": age,
      "size": rand(10..512),
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "priority": "P4",
      "recommendationDetails": recommendationDetails,
      "recommenderSubtype": "SNAPSHOT_AND_DELETE_DISK",
      "state": "ACTIVE",
      "status": "READY",
      "service": "Compute Engine",
      "selfLink": selfLink
    }

    result << entry
  end

  return result
end

def google_rightsize_vm_recommendations_underutil(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountId = "rightscale.com:resat-prem"
    accountName = "RightScale-Resat-Premium"
    projectNumber = rand(1000000000000..9999999999999).to_s
    region = get_random_google_region
    zone = get_random_google_zone(region)

    resourceID = rand(10000000000000000000..99999999999999999999).to_s
    resourceName = get_random_name

    type = get_random_google_compute_size
    resourceType = type[0]
    newResourceType = type[1]

    selfLink = "https://www.googleapis.com/compute/v1/projects/" + accountId + "/zones/" + zone + "/instances/" + resourceName

    recommendationDetails = "Save cost by changing machine type of Underutilized VM '" + resourceName + "'."

    entry = {
      "accountID": accountId,
      "accountName": accountName,
      "projectNumber": projectNumber,
      "resourceID": resourceID,
      "resourceName": resourceName,
      "resourceType": resourceType,
      "newResourceType": newResourceType,
      "zone": zone,
      "region": region,
      "hostname": resourceName,
      "platform": get_random_google_compute_platform,
      "cpuMaximum": rand(60..99) + (rand(1..99).to_f / 100),
      "cpuMinimum": rand(1..10) + (rand(1..99).to_f / 100),
      "cpuAverage": rand(11..39) + (rand(1..99).to_f / 100),
      "primaryImpactCategory": "COST",
      "tags": get_random_tags,
      "service": "Compute Engine",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "priority": "P4",
      "recommendationDetails": recommendationDetails,
      "recommenderSubtype": "CHANGE_MACHINE_TYPE",
      "state": "ACTIVE",
      "status": "RUNNING",
      "selfLink": selfLink
    }

    result << entry
  end

  return result
end

def google_rightsize_vm_recommendations_idle(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountId = "rightscale.com:resat-prem"
    accountName = "RightScale-Resat-Premium"
    projectNumber = rand(1000000000000..9999999999999).to_s
    region = get_random_google_region
    zone = get_random_google_zone(region)

    resourceID = rand(10000000000000000000..99999999999999999999).to_s
    resourceName = get_random_name
    resourceType = get_random_google_compute_size[rand(0..1)]

    selfLink = "https://www.googleapis.com/compute/v1/projects/" + accountId + "/zones/" + zone + "/instances/" + resourceName

    recommendationDetails = "Save cost by stopping Idle VM '" + resourceName + "'."

    entry = {
      "accountID": accountId,
      "accountName": accountName,
      "projectNumber": projectNumber,
      "resourceID": resourceID,
      "resourceName": resourceName,
      "resourceType": resourceType,
      "zone": zone,
      "region": region,
      "hostname": resourceName,
      "platform": get_random_google_compute_platform,
      "cpuMaximum": rand(5..20) + (rand(1..99).to_f / 100),
      "cpuMinimum": rand(1..2) + (rand(1..99).to_f / 100),
      "cpuAverage": rand(3..4) + (rand(1..99).to_f / 100),
      "primaryImpactCategory": "COST",
      "tags": get_random_tags,
      "service": "Compute Engine",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "priority": "P4",
      "recommendationDetails": recommendationDetails,
      "recommenderSubtype": "STOP_VM",
      "state": "ACTIVE",
      "status": "RUNNING",
      "selfLink": selfLink
    }

    result << entry
  end

  return result
end

def google_sql_idle_instance_recommendations(iterations = $default_iterations)
  result = []

  for iteration in 1..iterations do
    accountId = "rightscale.com:resat-prem"
    accountName = "RightScale-Resat-Premium"
    projectNumber = rand(1000000000000..9999999999999).to_s

    resourceID = get_random_name
    resourceName = resourceID

    selfLink = "https://www.googleapis.com/sql/v1beta4/projects/" + accountId + "/instances/" + resourceID

    recommendationDetails = "Save cost by stopping Idle Cloud SQL '" + resourceName + "'."

    entry = {
      "accountID": accountId,
      "accountName": accountName,
      "projectNumber": projectNumber,
      "resourceID": resourceID,
      "resourceType": "CLOUD_SQL_INSTANCE",
      "region": get_random_google_region,
      "timeCreated": get_random_date(rand((Time.now.year - 4)..(Time.now.year - 1))),
      "primaryImpactCategory": "COST",
      "tags": get_random_tags,
      "service": "Cloud SQL",
      "pricingPlan": "PACKAGE",
      "savings": get_random_savings,
      "savingsCurrency": get_currency,
      "priority": "P4",
      "recommendationDetails": recommendationDetails,
      "recommenderSubtype": "DELETE_RESOURCE",
      "platform": get_random_google_db_version,
      "diskType": "PD_SSD",
      "size": rand(10..1024),
      "availabilityType": "ZONAL",
      "replicationType": "SYNCHRONOUS",
      "state": "ACTIVE",
      "status": "READY",
      "resourceName": resourceName,
      "selfLink": selfLink
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
