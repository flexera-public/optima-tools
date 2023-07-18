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
  "c5n.xlarge",
  "m6i.8xlarge",
  "r5.2xlarge",
  "m5.8xlarge",
  "r5.xlarge",
  "c4n.xlarge",
  "m5i.8xlarge",
  "r4.2xlarge",
  "m4.8xlarge",
  "c3n.xlarge"
]

type_downsize_list = [
  "c4n.xlarge",
  "m5i.8xlarge",
  "r4.2xlarge",
  "m4.8xlarge",
  "r4.xlarge",
  "c3n.xlarge",
  "m4i.8xlarge",
  "r3.2xlarge",
  "m3.8xlarge",
  "c2n.xlarge"
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

result = []

for (var i = 0; i < 50; i++) {
  id = "i-" + (Math.random() + 1).toString(36).substring(2)
  ip = "ip-" + parseInt(Math.random() * 100) + '-'  + parseInt(Math.random() * 100) + '-' + parseInt(Math.random() * 100) + '-' + parseInt(Math.random() * 100)
  resourceName = generateRandomName()

  result.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": generateRandomName(),
    "cpu_average": parseFloat((Math.random() + 3).toFixed(2)),
    "cpu_maximum": parseFloat((Math.random() + 5).toFixed(2)),
    "cpu_minimum": parseFloat((Math.random()).toFixed(2)),
    "cpu_p90": parseFloat((Math.random()).toFixed(2)),
    "cpu_p95": parseFloat((Math.random()).toFixed(2)),
    "cpu_p99": parseFloat((Math.random()).toFixed(2)),
    "hostname": ip,
    "id": id,
    "idleMemoryThreshold": 5,
    "idleThreshold": 5,
    "launchTime": getRandomDate(current_year - 1 - parseInt(Math.random() * 5)),
    "lookbackPeriod": "30 days",
    "mem_average": parseFloat((Math.random() + 3).toFixed(2)),
    "mem_maximum": parseFloat((Math.random() + 5).toFixed(2)),
    "mem_minimum": parseFloat((Math.random()).toFixed(2)),
    "mem_p90": parseFloat((Math.random()).toFixed(2)),
    "mem_p95": parseFloat((Math.random()).toFixed(2)),
    "mem_p99": parseFloat((Math.random()).toFixed(2)),
    "platform": "Linux/UNIX",
    "privateDnsName": ip + ".ec2.internal",
    "recommendationType": "Terminate",
    "recommendedVmSize": "Terminate Instance",
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceID": id,
    "resourceName": resourceName,
    "resourceType": type_list[parseInt(Math.random() * 10)],
    "savings": parseFloat((Math.random() * Math.random() * 100).toFixed(3)),
    "savingsCurrency": "US$",
    "service": "EC2",
    "summaryData": {
      "idleInstanceCount": 38,
      "idleMessage": "The total estimated monthly savings is US$ 1,276.63",
      "underutilInstanceCount": 16,
      "underutilMessage": "The total estimated monthly savings is US$ 142.24"
    },
    "tags": "name=" + resourceName + ", " + tag_list[parseInt(Math.random() * 10)],
    "thresholdType": "average",
    "underutilMemoryThreshold": 40,
    "underutilThreshold": 40
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
