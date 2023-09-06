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

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 50; i++) {
  currentAverageHourlyOnDemandSpend = (Math.random() * 100).toFixed(2)
  currentMaximumHourlyOnDemandSpend = (Math.random() * 100).toFixed(2)
  currentMinimumHourlyOnDemandSpend = (Math.random() * 10).toFixed(2)
  estimatedMonthlySavingsAmount = (Math.random() * 10000).toFixed(2)
  estimatedSavingsPlanCost = (Math.random() * 10000).toFixed(2)
  hourlyCommitmentToPurchase = (Math.random() * 100).toFixed(2)

  result.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": generateRandomName(),
    "currencyCode": "USD",
    "currentAverageHourlyOnDemandSpend": currentAverageHourlyOnDemandSpend,
    "currentAverageHourlyOnDemandSpendWithCurrencyCode": currentAverageHourlyOnDemandSpend + " USD",
    "currentMaximumHourlyOnDemandSpend": currentMaximumHourlyOnDemandSpend,
    "currentMaximumHourlyOnDemandSpendWithCurrencyCode": currentMaximumHourlyOnDemandSpend + " USD",
    "currentMinimumHourlyOnDemandSpend": currentMinimumHourlyOnDemandSpend,
    "currentMinimumHourlyOnDemandSpendWithCurrencyCode": currentMinimumHourlyOnDemandSpend + " USD",
    "estimatedAverageUtilization": (Math.random() * 100).toFixed(2),
    "estimatedMonthlySavingsAmount": estimatedMonthlySavingsAmount,
    "estimatedMonthlySavingsAmountWithCurrencyCode": estimatedMonthlySavingsAmount + " USD",
    "estimatedOnDemandCost": (Math.random() * 1000).toFixed(2),
    "estimatedROI": (Math.random() * 100).toFixed(2),
    "estimatedSavingsAmount": (Math.random() * 1000).toFixed(2),
    "estimatedSavingsPercentage": (Math.random() * 100).toFixed(1),
    "estimatedSavingsPlanCost": estimatedSavingsPlanCost,
    "estimatedSavingsPlanCostWithCurrencyCode": estimatedSavingsPlanCost + " USD",
    "hourlyCommitmentToPurchase": hourlyCommitmentToPurchase,
    "hourlyCommitmentToPurchaseWithCurrencyCode": hourlyCommitmentToPurchase + " USD",
    "instanceFamily": "",
    "lookbackPeriod": "Last 7 Days",
    "offeringId": (Math.random() + 1).toString(36).substring(3) + '-' + (Math.random() + 1).toString(36).substring(8) + '-' + (Math.random() + 1).toString(36).substring(8) + '-' + (Math.random() + 1).toString(36).substring(8) + '-' + (Math.random() + 1).toString(36).substring(2),
    "paymentOption": "No Upfront",
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceType": "Compute Savings Plan",
    "term": "1 Year",
    "upfrontCost": "0",
    "upfrontCostWithCurrencyCode": "0 USD"
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
