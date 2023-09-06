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

function generateRandomName() {
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
  ];

  randomAdjective = adjectives[Math.floor(Math.random() * adjectives.length)]
  randomAnimal = animals[Math.floor(Math.random() * animals.length)]

  return randomAdjective + randomAnimal
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

sku_compute = [
  "Standard_D16s_v4",
  "Standard_DS5_v2",
  "Standard_E16s_v3",
  "Standard_DS12_v2",
  "Standard_DS13_v2",
  "Standard_DS4_v2",
  "Standard_D3_v2",
  "Standard_D8s_v3",
  "Standard_D8s_v3",
  "Standard_D4a_v4",
  "Standard_D8s_v5",
  "Standard_DS3_v2",
  "Standard_D8as_v4",
  "Standard_D16as_v4",
  "Standard_E8s_v3",
  "Standard_E4s_v3",
  "Standard_D8_v3",
  "Standard_E32s_v3",
  "Standard_DS4_v2",
  "Standard_D8a_v4",
  "Standard_D4s_v3",
  "Standard_DS5_v2",
  "Standard_D16s_v3",
  "Standard_E8s_v3",
  "Standard_DS4_v2",
  "Standard_D4s_v4",
  "Standard_E32s_v3",
  "Standard_E8-4s_v3",
  "Standard_D8s_v3",
  "Standard_E4s_v3",
  "Standard_D8a_v4",
  "Standard_D4s_v3",
  "Standard_DS5_v2",
  "Standard_E16s_v3",
  "Standard_E8-4s_v3",
  "Standard_D8s_v3",
  "Standard_D16s_v4",
  "Standard_D8s_v4",
  "Standard_D64s_v5"
]

sku_db = [
  "SQLMI_BC_Compute_Gen5",
  "SQLDB_HyperScale_Compute_Gen5",
  "SQLDB_BC_Compute_Gen5",
  "SQLDB_GP_Compute_Gen5",
  "SQLMI_BC_Compute_Gen5",
  "SQLMI_GP_Compute_Gen5",
  "SQLMI_BC_Compute_Gen5",
  "SQLDB_HyperScale_Compute_Gen5",
  "SQLDB_BC_Compute_Gen5",
  "SQLDB_GP_Compute_Gen5",
]

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 50; i++) {
  subscriptionId = account_list[parseInt(Math.random() * 10)]
  subscriptionName = generateRandomName()
  resourceGroup = generateRandomName().toUpperCase() + '-' + generateRandomName().toUpperCase()
  resourceName = generateRandomName()
  recommendedQuantity = parseInt(Math.random() * 10)

  sku_type = parseInt(Math.random() * 10)

  if (sku_type >= 8) {
    sku_type = "SQL"
  } else {
    sku_type = "Compute"
  }

  if (sku_type == "SQL") {
    sku = sku_db[parseInt(Math.random() * 10)]
    service = "SqlDataWarehouse"
  } else {
    sku = sku_compute[parseInt(Math.random() * 35)]
    service = "Microsoft.Compute"
  }

  totalCostWithRI = parseFloat((Math.random() * 10000).toFixed(3))
  costWithNoRI = (totalCostWithRI + (totalCostWithRI * Math.random())).toString()
  netSavings = (costWithNoRI - totalCostWithRI).toString()

  firstUsageDate = getRandomDate(current_year - 1 - parseInt(Math.random() * 1))

  result.push({
    "subscriptionId": subscriptionId,
    "subscriptionName": subscriptionName,
    "service": service,
    "skuName": sku,
    "region": region_list[parseInt(Math.random() * 10)],
    "term": "1 Year",
    "netSavings": netSavings,
    "recommendedQuantity": recommendedQuantity,
    "costWithNoRI": costWithNoRI,
    "totalCostWithRI": totalCostWithRI,
    "firstUsageDate": firstUsageDate,
    "meterId": resourceName,
    "instanceFlexibilityGroup": "NA",
    "instanceFlexibilityRatio": 1,
    "normalizedSize": sku,
    "recommendedQuantityNormalized": recommendedQuantity,
    "lookbackPeriod": "Last7Days",
    "scope": "Single",
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
