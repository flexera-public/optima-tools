// --------------------------------------
// Libraries
// --------------------------------------

var _ = require('underscore')

// --------------------------------------
// Functions
// --------------------------------------

function getRandomDate(year) {
  let start = new Date(year, 0, 1); // Start from January 1st of the given year
  let end = new Date(year + 1, 0, 1); // End at December 31st of the given year
  let randomDate = new Date(start.getTime() + Math.random() * (end.getTime() - start.getTime()));

  return randomDate.toISOString();
}

// --------------------------------------
// Dummy Data
// --------------------------------------

current_year = parseInt(new Date().toISOString().split('-')[0])

account_list = [
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

region_list = [
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

tag_list = [
  { environment: "prod", app: "paymentGateway" },
  { environment: "dev", app: "dataAnalytics" },
  { environment: "staging", app: "userManagement" },
  { environment: "prod", app: "reportingService" },
  { environment: "dev", app: "emailService" },
  { environment: "staging", app: "invoiceProcessing" },
  { environment: "prod", app: "securityModule" },
  { environment: "prod", app: "inventoryManagement" },
  { environment: "dev", app: "customerSupport" },
  { environment: "prod", app: "crmModule" }
]

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 25; i++) {
  subscriptionId = account_list[parseInt(Math.random() * 10)]
  subscriptionName = (Math.random() + 1).toString(36).substring(2)
  resourceGroup = (Math.random() + 1).toString(36).substring(2).toUpperCase() + '-' + (Math.random() + 1).toString(36).substring(2).toUpperCase()
  resourceName = (Math.random() + 1).toString(36).substring(2)
  serverName = (Math.random() + 1).toString(36).substring(2)
  resourceId = "/subscriptions/" + subscriptionId + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Sql/servers/" + serverName + "/databases/" + resourceName

  result.push({
    "average_cpu": (Math.random() + 50 * Math.random()).toFixed(2),
    "id": resourceId,
    "kind": "v12.0,user",
    "location": region_list[parseInt(Math.random() * 10)],
    "lookbackPeriod": "30 days",
    "name": serverName + "/" + resourceName,
    "recommendation": "Change tier",
    "recommended_capacity": "n/a",
    "resourceType": "Standard_Standard",
    "resource_group": resourceGroup,
    "sku": {
      "capacity": 10,
      "name": "Standard",
      "tier": "Standard"
    },
    "subscriptionId": subscriptionId,
    "subscriptionName": subscriptionName,
    "tags": tag_list[parseInt(Math.random() * 10)],
    "threshold": 60,
    "type": "Microsoft.Sql/servers/databases",
    "unit": "Percent"
  })
}

for (var i = 0; i < 25; i++) {
  subscriptionId = account_list[parseInt(Math.random() * 10)]
  subscriptionName = (Math.random() + 1).toString(36).substring(2)
  resourceGroup = (Math.random() + 1).toString(36).substring(2).toUpperCase() + '-' + (Math.random() + 1).toString(36).substring(2).toUpperCase()
  resourceName = (Math.random() + 1).toString(36).substring(2)
  serverName = (Math.random() + 1).toString(36).substring(2)
  resourceId = "/subscriptions/" + subscriptionId + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Sql/servers/" + serverName + "/databases/" + resourceName

  result.push({
    "average_cpu": (Math.random() + 50 * Math.random()).toFixed(2),
    "id": resourceId,
    "kind": "v12.0,user",
    "location": region_list[parseInt(Math.random() * 10)],
    "lookbackPeriod": "30 days",
    "name": serverName + "/" + resourceName,
    "recommendation": "Downsize",
    "recommended_capacity": "20",
    "resourceType": "Standard_Standard",
    "resource_group": resourceGroup,
    "sku": {
      "capacity": 50,
      "name": "Standard",
      "tier": "Standard"
    },
    "subscriptionId": subscriptionId,
    "subscriptionName": subscriptionName,
    "tags": tag_list[parseInt(Math.random() * 10)],
    "threshold": 60,
    "type": "Microsoft.Sql/servers/databases",
    "unit": "Percent"
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
