// --------------------------------------
// Libraries
// --------------------------------------

var _ = require('underscore')

// --------------------------------------
// Dummy Data
// --------------------------------------

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

times_list = [
  "2022-02-11T00:34:25.000Z",
  "2023-05-01T01:24:20.000Z",
  "2022-03-15T02:35:15.000Z",
  "2022-02-17T05:11:35.000Z",
  "2022-07-18T08:22:48.000Z",
  "2022-02-22T11:33:57.000Z",
  "2022-12-27T14:44:46.000Z",
  "2022-11-05T17:55:35.000Z",
  "2022-10-12T22:45:23.000Z",
  "2022-09-13T15:21:11.000Z"
]

type_list = [
  "Standard_A2_v2",
  "Standard_A4_v2",
  "Standard_B12ms",
  "Standard_B16as_v2",
  "Standard_B16ms",
  "Standard_B2ms",
  "Standard_B2s",
  "Standard_B32as_v2",
  "Standard_D16_v3",
  "Standard_B4ms"
]

type_downsize_list = [
  "Standard_A1_v2",
  "Standard_A3_v2",
  "Standard_B8ms",
  "Standard_B12as_v2",
  "Standard_B12ms",
  "Standard_B1ms",
  "Standard_B1s",
  "Standard_B16as_v2",
  "Standard_D8_v3",
  "Standard_B2ms"
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

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 25; i++) {
  subscriptionId = account_list[parseInt(Math.random() * 10)]
  subscriptionName = (Math.random() + 1).toString(36).substring(2)
  resourceGroup = (Math.random() + 1).toString(36).substring(2).toUpperCase() + '-' + (Math.random() + 1).toString(36).substring(2).toUpperCase()
  resourceName = (Math.random() + 1).toString(36).substring(2)
  resourceId = "/subscriptions/" + subscriptionId + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/virtualMachines/" + resourceName
  resourceNumber = parseInt(Math.random() * 10)

  result.push({
    "averageCPU": Math.random() + 10,
    "idleThreshold": 5,
    "lookbackPeriod": "30 days",
    "maxCPU": Math.random() + 20,
    "minCPU": Math.random(),
    "osType": "Linux",
    "recommendedVmSize": type_downsize_list[resourceNumber],
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceGroup": resourceGroup,
    "resourceId": resourceId,
    "resourceKind": "Microsoft.Compute/virtualMachines",
    "resourceName": resourceName,
    "resourceType": type_list[resourceNumber],
    "savings": parseFloat((Math.random() * Math.random() * 100).toFixed(3)),
    "savingsCurrency": "US$",
    "service": "Microsoft.Compute",
    "subscriptionId": subscriptionId,
    "subscriptionName": subscriptionName,
    "summaryData": {
      "idleInstanceCount": 4,
      "idleMessage": "The total estimated monthly savings is US$ 100.00",
      "underutilInstanceCount": 1,
      "underutilMessage": "The total estimated monthly savings is US$ 100.00"
    },
    "tags": [],
    "underutilThreshold": 40
  })
}

for (var i = 0; i < 25; i++) {
  subscriptionId = account_list[parseInt(Math.random() * 10)]
  subscriptionName = (Math.random() + 1).toString(36).substring(2)
  resourceGroup = (Math.random() + 1).toString(36).substring(2).toUpperCase() + '-' + (Math.random() + 1).toString(36).substring(2).toUpperCase()
  resourceName = (Math.random() + 1).toString(36).substring(2)
  resourceId = "/subscriptions/" + subscriptionId + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/virtualMachines/" + resourceName

  result.push({
    "averageCPU": Math.random() + 1,
    "idleThreshold": 5,
    "lookbackPeriod": "30 days",
    "maxCPU": Math.random() + 3,
    "minCPU": Math.random(),
    "osType": "Linux",
    "recommendedVmSize": "Terminate Instance",
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceGroup": resourceGroup,
    "resourceId": resourceId,
    "resourceKind": "Microsoft.Compute/virtualMachines",
    "resourceName": resourceName,
    "resourceType": type_list[parseInt(Math.random() * 10)],
    "savings": parseFloat((Math.random() * Math.random() * 100).toFixed(3)),
    "savingsCurrency": "US$",
    "service": "Microsoft.Compute",
    "subscriptionId": subscriptionId,
    "subscriptionName": subscriptionName,
    "summaryData": {
      "idleInstanceCount": 4,
      "idleMessage": "The total estimated monthly savings is US$ 100.00",
      "underutilInstanceCount": 1,
      "underutilMessage": "The total estimated monthly savings is US$ 100.00"
    },
    "tags": [],
    "underutilThreshold": 40
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
