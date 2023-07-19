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

region_list = [
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

ip_list = []

for (var i = 0; i < 50; i++) {
  region = region_list[parseInt(Math.random() * 10)]
  ip = parseInt(Math.random() * 100) + '.'  + parseInt(Math.random() * 100) + '.' + parseInt(Math.random() * 100) + '.' + parseInt(Math.random() * 100)
  savings = parseFloat((Math.random() * Math.random() * 10).toFixed(3))

  ip_list.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": generateRandomName(),
    "allocationID": "eipalloc-" + (Math.round(Math.random() * 1000000000) / 1000000000).toString().split('.')[1],
    "domain": "vpc",
    "publicIp": ip,
    "region": region,
    "resourceName": generateRandomName() + '/' + (Math.random() + 1).toString(36).substring(8),
    "savings": savings,
    "savingsCurrency": "$",
    "service": "EC2",
    "tags": tag_list[parseInt(Math.random() * 10)]
  })
}

result = {
  "accountID": account_list[parseInt(Math.random() * 10)],
  "ip_list": ip_list,
  "message": "The total estimated monthly savings are $ 25.2"
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
