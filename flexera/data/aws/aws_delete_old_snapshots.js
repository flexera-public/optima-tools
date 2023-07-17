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

// --------------------------------------
// Script
// --------------------------------------

snapshots = []

for (var i = 0; i < 50; i++) {
  snapshots.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": (Math.random() + 1).toString(36).substring(2),
    "daysOld": parseInt(Math.random() * 200),
    "dbClusterId": (Math.random() + 1).toString(36).substring(2),
    "dbInstanceId": "",
    "imageId": "",
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceName": (Math.random() + 1).toString(36).substring(2),
    "resourceType": "Storage Snapshot",
    "savings": parseFloat((Math.random() * Math.random() * 100).toFixed(3)),
    "savingsCurrency": "US$",
    "service": "RDS",
    "snapshotId": (Math.random() + 1).toString(36).substring(2),
    "tags": [],
    "volumeSize": parseInt(Math.random() * 500).toFixed(0)
  })
}

result = {
  "message": "The total estimated monthly savings are US$ 246.70",
  "result": snapshots
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
