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

// --------------------------------------
// Script
// --------------------------------------

volumes = []

for (var i = 0; i < 50; i++) {
  region = region_list[parseInt(Math.random() * 10)]

  volumes.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": (Math.random() + 1).toString(36).substring(2),
    "age": parseInt(Math.random() * 200) + " days",
    "availabilityZone": region + 'a',
    "createdTime": times_list[parseInt(Math.random() * 10)],
    "lookbackPeriod": "30 days",
    "region": region,
    "resourceName": (Math.random() + 1).toString(36).substring(2),
    "resourceType": "gp" + (parseInt(Math.random() * 2) + 2),
    "savings": parseFloat((Math.random() * Math.random() * 100).toFixed(3)),
    "savingsCurrency": "US$",
    "service": "EBS",
    "size": parseInt(Math.random() * 500).toFixed(0) + " GB",
    "status": "available",
    "tags": [],
    "volumeId": "vol-" + (Math.random() + 1).toString(36).substring(2)
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
