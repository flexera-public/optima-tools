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

// --------------------------------------
// Script
// --------------------------------------

volumes = []

for (var i = 0; i < 50; i++) {
  subscriptionId = account_list[parseInt(Math.random() * 10)]
  subscriptionName = generateRandomName()
  resourceGroup = generateRandomName().toUpperCase() + '-' + generateRandomName().toUpperCase()
  resourceName = generateRandomName()
  resourceId = "/subscriptions/" + subscriptionId + "/resourceGroups/" + resourceGroup + "/providers/Microsoft.Compute/disks/" + resourceName

  savings = parseFloat((Math.random() * Math.random() * 1000).toFixed(3))

  volumes.push({
    "diskSize": parseInt(Math.random() * 500).toFixed(0),
    "disk_id": resourceId,
    "lookbackPeriod": 30,
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceGroup": resourceGroup,
    "resourceName": resourceName,
    "resourceType": "Microsoft.Compute/disks",
    "savings": savings,
    "savingsCurrency": "US$",
    "service": "Microsoft.Compute",
    "subscriptionID": subscriptionId,
    "subscriptionName": subscriptionName,
    "tags": tag_list[parseInt(Math.random() * 10)]
  })
}

result = {
  "message": "The total estimated monthly savings are US$ 172.03",
  "instances": volumes
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))