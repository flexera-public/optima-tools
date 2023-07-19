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
  "us-central1",
  "europe-west1",
  "asia-northeast1",
  "us-west1",
  "australia-southeast1",
  "southamerica-east1",
  "northamerica-northeast1",
  "europe-west4",
  "asia-southeast2",
  "europe-west6"
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

description_list = [
  "Purchase a 1 year new standard CUD for RegularCore CPU",
  "Purchase a 1 year new standard CUD for RegularRAM memory",
  "Purchase a 1 year new standard CUD for E2Core CPU",
  "Purchase a 1 year new standard CUD for E2RAM memory",
  "Purchase a 1 year new standard CUD for N2DRAM memory",
  "Purchase a 1 year new standard CUD for N2DCore CPU",
  "Purchase a 1 year additional standard CUD for RegularCore CPU",
  "Purchase a 1 year additional standard CUD for RegularRAM memory",
  "Purchase a 1 year additional standard CUD for E2RAM memory",
  "Purchase a 1 year additional standard CUD for N2DCore CPU",
]

// --------------------------------------
// Script
// --------------------------------------

function recommendation_generator() {
  const characters = 'abcdef0123456789';
  let randomString = '';

  for (let i = 0; i < 8; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    randomString += characters[randomIndex];
  }

  randomString += '-';

  for (let i = 0; i < 3; i++) {
    for (let j = 0; j < 4; j++) {
      const randomIndex = Math.floor(Math.random() * characters.length);
      randomString += characters[randomIndex];
    }

    randomString += '-';
  }

  for (let i = 0; i < 12; i++) {
    const randomIndex = Math.floor(Math.random() * characters.length);
    randomString += characters[randomIndex];
  }

  return randomString;
}

instances = []

for (var i = 0; i < 50; i++) {
  accountId = "rightscale.com:resat-prem"
  accountName = "RightScale-Resat-Premium"
  projectNumber = (Math.random() * 1000000000000).toFixed(0)
  region = region_list[parseInt(Math.random() * 10)]
  recommendation = recommendation_generator()
  resourceID = "projects/" + projectNumber + "/locations/" + region + "/recommenders/google.compute.commitment.UsageCommitmentRecommender/recommendations/" + recommendation
  resourceName = "cud-recommendation-" + (Math.random() * 10000000000).toFixed(0)

  instances.push({
    "algorithm": "Optimal (Break-Even Point)",
    "savingsCurrency": "US$",
    "description": description_list[parseInt(Math.random() * 10)],
    "savings": parseFloat((Math.random() * Math.random() * 1000).toFixed(3)),
    "id": resourceID,
    "priority": "P4",
    "accountID": accountId,
    "accountName": accountName,
    "projectNumber": projectNumber,
    "region": region,
    "resourceID": resourceID,
    "resourceName": resourceName,
    "resourceType": "GENERAL_PURPOSE",
    "state": "ACTIVE",
    "recommenderSubtype": "PROJECT_SCOPED_COMMITMENTS",
    "tags": "",
    "plan": "1 Year",
    "resourcesToPurchase": 1
  })
}

result = {
  "message": "The total estimated monthly savings are US$ 7833.10",
  "instances": instances
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))