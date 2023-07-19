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

volumes = []

for (var i = 0; i < 50; i++) {
  region = region_list[parseInt(Math.random() * 10)]

  createdTime = getRandomDate(current_year - 1 - parseInt(Math.random() * 2))
  age = Math.round((new Date() - new Date(createdTime)) / 1000 / 60 / 60 / 24)

  savings = parseFloat((Math.random() * Math.random() * 1000).toFixed(3))

  volumes.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": generateRandomName(),
    "age": age + " days",
    "availabilityZone": region + 'a',
    "createdTime": createdTime,
    "lookbackPeriod": "30 days",
    "region": region,
    "resourceName": generateRandomName(),
    "resourceType": "gp" + (parseInt(Math.random() * 2) + 2),
    "savings": savings,
    "savingsCurrency": "US$",
    "service": "EBS",
    "size": parseInt(Math.random() * 500).toFixed(0) + " GB",
    "status": "available",
    "tags": tag_list[parseInt(Math.random() * 10)],
    "volumeId": "vol-" + generateRandomName()
  })
}

result = {
  "accountID": account_list[parseInt(Math.random() * 10)],
  "message": "The total estimated monthly savings are US$ 171.29",
  "unused_volumes": volumes
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
