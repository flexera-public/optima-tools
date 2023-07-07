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
  "cache.t2",
  "cache.r4",
  "cache.m4",
  "cache.r3",
  "cache.m3",
  "cache.r2",
  "cache.m2",
  "cache.r5",
  "cache.m5",
  "cache.t3"
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
  resourceType = type_list[parseInt(Math.random() * 10)]

  result.push({
    "accountID": account_list[parseInt(Math.random() * 10)],
    "accountName": (Math.random() + 1).toString(36).substring(2),
    "accountScope": "Linked",
    "availabilityZone": "",
    "averageNormalizedUnitsUsedPerHour": "NaN",
    "averageNumberOfInstancesUsedPerHour": parseInt(Math.random() * 10).toFixed(0),
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
    "instanceType": "",
    "licenseModel": "",
    "lookbackPeriodInDays": "7",
    "maximumNormalizedUnitsUsedPerHour": "NaN",
    "maximumNumberOfInstancesUsedPerHour": parseInt(Math.random() * 10).toFixed(0),
    "minimumNormalizedUnitsUsedPerHour": "NaN",
    "minimumNumberOfInstancesUsedPerHour": parseInt(Math.random() * 10).toFixed(0),
    "nodeType": resourceType + ".large",
    "paymentOption": "Heavy_Utilization",
    "platform": "",
    "productDescription": "Redis",
    "recommendedNormalizedUnitsToPurchase": "NA",
    "recommendedNumberOfInstancesToPurchase": parseInt(Math.random() * 10).toFixed(0),
    "recurringStandardMonthlyCost": (Math.random() * Math.random() * 1000).toFixed(2),
    "region": region_list[parseInt(Math.random() * 10)],
    "resourceType": resourceType + ".large",
    "service": "ElastiCache",
    "sizeFlexEligible": "false",
    "tenancy": "",
    "term": "1 year",
    "upfrontCost": (Math.random() * Math.random() * 1000).toFixed(2)
  })
}

// --------------------------------------
// Output
// --------------------------------------

console.log(JSON.stringify(result, '', 2))
