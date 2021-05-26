import json
import logging
import requests
import click
import sys
import flexera
import urllib3
from urllib3.exceptions import InsecureRequestWarning

@click.command()
@click.option('--refresh-token', prompt="Refresh Token", help='Refresh Token from CM or FlexeraOne')
@click.option('--shard', type=click.Choice(['3', '4', 'F1'], case_sensitive=False), prompt='Shard for authentication', help='Shard for authentication')
@click.option('--disable-tls-verify', is_flag=True)
@click.option('--org-id', '-o', required=True)
@click.option('--resource-id', '-r', required=True)

def main(refresh_token, shard, disable_tls_verify, resource_id, org_id):
  logging.basicConfig(format='%(levelname)s:%(asctime)s:%(message)s', stream=sys.stderr, level=logging.INFO)

  if shard not in ['F1','3','4']:
    logging.error('Invalid Shard Number ' + shard)
    sys.exit(1)

  if shard == 'F1':
    token_url = "https://login.flexera.com/oidc/token"
  else:
    token_url = "https://us-"+ shard +".rightscale.com/api/oauth2"

  if disable_tls_verify:
    urllib3.disable_warnings(InsecureRequestWarning)
    tls_verify = False
  else:
    tls_verify = True

  #logging.info("OAuth2: Getting Access Token via Refresh Token...")
  r = requests.post(token_url, data={"grant_type": "refresh_token", "refresh_token": refresh_token}, headers={"X-API-Version": "1.5"}, verify=tls_verify)
  r.raise_for_status()
  access_token = r.json()["access_token"]
  bill_analysis_url = "https://optima.rightscale.com/bill-analysis/orgs/{}/costs/select".format(org_id)
  query = {
    "billing_center_ids": [
    ],
    "dimensions": [
      "resource_id",
      "billing_center_id"
    ],
    "end_at": "2021-04",
    "filter": {
      "dimension": "resource_id",
      "type": "equal",
      "value": resource_id
    },
    "granularity": "month",
    "limit": 1000,
    "metrics": [
      "cost_amortized_blended_adj"
    ],
    "start_at": "2021-01"
  }
  auth_headers = {"Authorization": "Bearer " + access_token, "Api-Version": "1.0"}
  kwargs = {"headers": auth_headers, "allow_redirects": False}
  billing_centers_url = "https://optima.rightscale.com/analytics/orgs/{}/billing_centers?view=allocation_table".format(org_id)
  b = requests.get(billing_centers_url,**kwargs)
  items = b.json()
  parent_billing_centers = []
  for i in items:
    if 'parent_id' not in i:
      parent_billing_centers.append(i['id'])
  query['billing_center_ids'] = parent_billing_centers

  r = requests.post(bill_analysis_url, json.dumps(query), **kwargs)
  logging.info("Response: {}\n{}".format(r.status_code, json.dumps(r.json(), indent=4)))
  r.raise_for_status()
  total_cost = 0
  for i in r.json()["rows"]:
    total_cost = total_cost + i["metrics"]["cost_amortized_blended_adj"]
  print(total_cost)


if __name__ == '__main__':
  # click passes no args
  # pylint: disable=no-value-for-parameter
  main()
