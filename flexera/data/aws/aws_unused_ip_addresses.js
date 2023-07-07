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

ip_list = []

for (var i = 0; i < 20; i++) {
  region = region_list[parseInt(Math.random() * 10)]
  ip = parseInt(Math.random() * 100) + '.'  + parseInt(Math.random() * 100) + '.' + parseInt(Math.random() * 100) + '.' + parseInt(Math.random() * 100)

  ip_list.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": (Math.random() + 1).toString(36).substring(2),
    "allocationID": "eipalloc-" + (Math.round(Math.random() * 1000000000) / 1000000000).toString().split('.')[1],
    "domain": "vpc",
    "publicIp": ip,
    "region": region,
    "resourceName": (Math.random() + 1).toString(36).substring(2) + '/' + (Math.random() + 1).toString(36).substring(8),
    "savings": parseFloat((Math.random() * Math.random() * 100).toFixed(3)),
    "savingsCurrency": "$",
    "service": "EC2",
    "tags": []
  })
}

result = {
  "accountID": account_list[parseInt(Math.random() * 10)],
  "ip_list": ip_list,
  "message": "The total estimated monthly savings are $ 25.2"
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
