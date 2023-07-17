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

meter_list = [
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

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 50; i++) {
  subscriptionId = account_list[parseInt(Math.random() * 10)]
  subscriptionName = (Math.random() + 1).toString(36).substring(2)
  resourceGroup = (Math.random() + 1).toString(36).substring(2).toUpperCase() + '-' + (Math.random() + 1).toString(36).substring(2).toUpperCase()
  resourceName = (Math.random() + 1).toString(36).substring(2) + (Math.random() + 1).toString(36).substring(2) + (Math.random() + 1).toString(36).substring(2)
  sku = "SQL_" + (Math.random() + 1).toString(36).substring(6)
  id = "/subscriptions/" + subscriptionId + "/providers/Microsoft.CostManagement/benefitRecommendations/" + resourceName

  totalCostWithRI = parseFloat((Math.random() * 10000).toFixed(3))
  costWithNoRI = (totalCostWithRI + (totalCostWithRI * Math.random()))
  netSavings = (costWithNoRI - totalCostWithRI)

  result.push({
    "averageUtilizationPercentage": parseFloat((Math.random() * 100).toFixed(3)),
    "benefitCost": 54,
    "commitmentAmount": parseFloat(Math.random().toFixed(2)),
    "commitmentGranularity": "Hourly",
    "costWithoutBenefit": costWithNoRI,
    "coveragePercentage": parseFloat((Math.random() * 50).toFixed(3)),
    "id": id,
    "kind": "SavingsPlan",
    "lookbackPeriod": "Last7Days",
    "name": resourceName,
    "overageCost": parseFloat((Math.random() * 20).toFixed(2)),
    "savingsAmount": netSavings,
    "savingsPercentage": parseFloat(Math.random().toFixed(3)),
    "scope": "Single",
    "subscriptionId": subscriptionId,
    "subscriptionName": subscriptionName,
    "term": "P3Y",
    "totalCost": totalCostWithRI,
    "totalHours": 150,
    "wastageCost": 23.924
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
