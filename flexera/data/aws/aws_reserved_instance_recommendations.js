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

instance_type_list = [
  "r5.large",
  "m5.large",
  "c4.large",
  "t2.nano",
  "t3.nano",
  "c6i.large",
  "c5.xlarge",
  "i4i.large",
  "g4dn.xlarge",
  "c5a.large",
  "m4.large",
  "g5.2xlarge",
  "c6a.2xlarge",
  "t3a.nano",
  "c6a.8xlarge",
  "m4.2xlarge",
  "c6g.medium",
  "im4gn.large",
  "c5d.large",
  "r6g.medium",
  "t3.xlarge",
  "m6i.large",
  "m6gd.medium",
  "g5.4xlarge",
  "m3.medium",
  "r6i.large",
  "c5.4xlarge",
  "c5.large"
]

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 50; i++) {
  instanceType = instance_type_list[parseInt(Math.random() * 10)]
  resourceType = instanceType.split('.')[0]

  result.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": generateRandomName(),
    "accountScope": "Linked",
    "availabilityZone": "",
    "averageNormalizedUnitsUsedPerHour": parseFloat((Math.random() * 1000).toFixed(2)),
    "averageNumberOfInstancesUsedPerHour": parseFloat((Math.random() * 1000).toFixed(2)),
    "averageUtilization": parseInt(Math.random() * 100).toFixed(0),
    "databaseEdition": "",
    "databaseEngine": "",
    "deploymentOption": "",
    "estimatedBreakEvenInMonths": (Math.random() * Math.random() * 100).toFixed(2),
    "estimatedMonthlyOnDemandCost": (Math.random() * Math.random() * 1000).toFixed(2),
    "estimatedMonthlySavingsAmount": (Math.random() * Math.random() * 1000).toFixed(2),
    "estimatedMonthlySavingsPercentage": parseInt(Math.random() * 100).toFixed(0),
    "estimatedReservationCostForLookbackPeriod": (Math.random() * Math.random() * 100).toFixed(2),
    "family": resourceType,
    "instanceClass": "",
    "instanceSize": "",
    "instanceType": instanceType,
    "licenseModel": "",
    "lookbackPeriodInDays": "7",
    "maximumNormalizedUnitsUsedPerHour": parseFloat((Math.random() * 100).toFixed(2)),
    "maximumNumberOfInstancesUsedPerHour": parseFloat((Math.random() * 100).toFixed(2)),
    "minimumNormalizedUnitsUsedPerHour": parseFloat((Math.random() * 100).toFixed(2)),
    "minimumNumberOfInstancesUsedPerHour": parseFloat((Math.random() * 100).toFixed(2)),
    "nodeType": instanceType,
    "paymentOption": "Partial_Upfront",
    "platform": "",
    "productDescription": "Linux/UNIX",
    "recommendedNormalizedUnitsToPurchase": parseInt(Math.random() * 10).toFixed(0),
    "recommendedNumberOfInstancesToPurchase": parseInt(Math.random() * 10).toFixed(0),
    "recurringStandardMonthlyCost": (Math.random() * Math.random() * 1000).toFixed(2),
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceType": resourceType,
    "service": "Elastic Compute Cloud (EC2)",
    "sizeFlexEligible": "false",
    "tenancy": "Shared",
    "term": "1 year",
    "upfrontCost": (Math.random() * Math.random() * 1000).toFixed(2)
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
