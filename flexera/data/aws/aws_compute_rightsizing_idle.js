// --------------------------------------
// Libraries
// --------------------------------------

var _ = require('underscore')

// --------------------------------------
// Dummy Data
// --------------------------------------

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

// --------------------------------------
// Script
// --------------------------------------

result = []

for (var i = 0; i < 20; i++) {
  id = "i-" + (Math.random() + 1).toString(36).substring(2)
  ip = "ip-" + parseInt(Math.random() * 100) + '-'  + parseInt(Math.random() * 100) + '-' + parseInt(Math.random() * 100) + '-' + parseInt(Math.random() * 100)
  resourceName = (Math.random() + 1).toString(36).substring(2)

  result.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": (Math.random() + 1).toString(36).substring(2),
    "cpu_average": Math.random() + 3,
    "cpu_maximum": Math.random() + 5,
    "cpu_minimum": Math.random(),
    "cpu_p90": Math.random(),
    "cpu_p95": Math.random(),
    "cpu_p99": Math.random(),
    "hostname": ip,
    "id": id,
    "idleMemoryThreshold": 5,
    "idleThreshold": 5,
    "launchTime": times_list[parseInt(Math.random() * 10)],
    "lookbackPeriod": "30 days",
    "mem_average": Math.random() + 3,
    "mem_maximum": Math.random() + 5,
    "mem_minimum": Math.random(),
    "mem_p90": Math.random(),
    "mem_p95": Math.random(),
    "mem_p99": Math.random(),
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
    "tags": "name=" + resourceName,
    "thresholdType": "average",
    "underutilMemoryThreshold": 40,
    "underutilThreshold": 40
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
