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

type_list = [
  "c5n.xlarge",
  "m6i.8xlarge",
  "r5.2xlarge",
  "m5.8xlarge",
  "t2.micro",
  "c4n.xlarge",
  "m5i.8xlarge",
  "r4.2xlarge",
  "m4.8xlarge",
  "c3n.xlarge"
]

// --------------------------------------
// Script
// --------------------------------------

dbs = []

for (var i = 0; i < 50; i++) {
  accountid = account_list[parseInt(Math.random() * 10)]
  region = region_list[parseInt(Math.random() * 10)]
  dbInstanceIdentifier = (Math.random() + 1).toString(36).substring(2)
  resourceType = 'db.' + type_list[parseInt(Math.random() * 10)]
  resourceName = (Math.random() + 1).toString(36).substring(2)
  id = "db-" + ((Math.random() + 1).toString(36).substring(2) + (Math.random() + 1).toString(36).substring(2)).toUpperCase()

  dbs.push({
    "accountID": accountid,
    "accountName": (Math.random() + 1).toString(36).substring(2),
    "arn": "arn:aws:rds:" + region + ":" + accountid + ":" + dbInstanceIdentifier,
    "databaseEngine": "aurora-postgresql",
    "engineVersion": (Math.random() * 10).toFixed(2),
    "id": id,
    "lookbackPeriod": "30 days",
    "name": resourceName,
    "privateDnsName": resourceName + ".cywk0fv0xrmm." + region + ".rds.amazonaws.com",
    "region": region,
    "resourceID": id,
    "resourceType": resourceType,
    "savings": parseFloat((Math.random() * Math.random() * 100).toFixed(3)),
    "savingsCurrency": "US$",
    "service": "RDS",
    "status": "available",
    "tags": []
  })
}

result = {
  "accountID": account_list[parseInt(Math.random() * 10)],
  "instance_list": dbs,
  "message": "The total estimated monthly savings are US$ 204.56",
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
