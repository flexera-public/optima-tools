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

type_list = [
  "c5n",
  "m6i",
  "r5",
  "m5",
  "t2",
  "c4n",
  "m5i",
  "r4",
  "m4",
  "c3n"
]

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 50; i++) {
  accountid = account_list[parseInt(Math.random() * 10)]
  region = region_list[parseInt(Math.random() * 10)]
  dbInstanceIdentifier = generateRandomName()
  resourceType = type_list[parseInt(Math.random() * 10)]

  result.push({
    "accountId": accountid,
    "accountName": generateRandomName(),
    "availabilityZone": region + 'a',
    "databaseEngine": "aurora-postgresql",
    "dbInstanceArn": "arn:aws:rds:" + region + ":" + accountid + ":" + dbInstanceIdentifier,
    "dbInstanceClass": "db." + resourceType + ".xlarge",
    "dbInstanceIdentifier": dbInstanceIdentifier,
    "engineVersion": (Math.random() * 10).toFixed(2),
    "lookbackPeriod": "30 days",
    "percent_cpu_avg": (Math.random() * 5).toFixed(2),
    "recommended_size": "db." + resourceType + ".large",
    "region": region,
    "threshold": "< 60"
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
