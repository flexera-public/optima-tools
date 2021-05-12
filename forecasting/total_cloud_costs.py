import json
import logging
import requests
import sys
import click

@click.command(no_args_is_help=True)
@click.option('--refresh-token', prompt="Refresh Token", help='Refresh Token from FlexeraOne', required=True)
@click.option('--org-id', '-o', prompt="MSP Org ID", required=True)
@click.option('--past-months', '-p', prompt="Past Months", type=int, default=3)
@click.option('--months', '-m', prompt="Forecasted Months", type=int, default=1)
def generate_cloud_cost_forecast(refresh_token, org_id, past_months):
    # Tweak the destination (e.g. sys.stdout instead) and level (e.g. logging.DEBUG instead) to taste!
    logging.basicConfig(format='%(levelname)s:%(asctime)s:%(message)s', stream=sys.stderr, level=logging.INFO)
    access_token = generate_access_token(refresh_token)
    optima_data = {}
    for month in range(0, past_months):
        optima_data[month] = get_optima_data(org_id, access_token, (month-1), month)
    plot_optima_data(optima_data)

def generate_access_token(refresh_token):
    token_url = "https://login.flexera.com/oidc/token"
    logging.info("OAuth2: Getting Access Token via Refresh Token for {} ...".format(token_url))
    token_post_request = requests.post(token_url, data={"grant_type": "refresh_token", "refresh_token": refresh_token})
    token_post_request.raise_for_status()
    access_token = token_post_request.json()["access_token"]
    return access_token

def get_optima_data(org_id, access_token, start_month, end_month):
    bill_analysis_url = "https://optima.rightscale.com/bill-analysis/orgs/{}/costs/aggregated".format(org_id)
    auth_headers = {"Authorization": "Bearer " + access_token, "Api-Version": "1.0"}
    kwargs = {"headers": auth_headers, "allow_redirects": False}
    billing_centers_url = "https://optima.rightscale.com/analytics/orgs/{}/billing_centers?view=allocation_table".format(org_id)
    b = requests.get(billing_centers_url, **kwargs)
    items = b.json()
    parent_billing_centers = []
    for i in items:
        if 'parent_id' not in i:
            parent_billing_centers.append(i['id'])

    query = {
        "billing_center_ids": parent_billing_centers,
        "dimensions": [
            "billing_center_id"
        ],
        "end_at": end_month,
        "granularity": "month",
        "limit": 1000,
        "metrics": [
            "cost_amortized_blended_adj"
        ],
        "start_at": start_month
    }

    r = requests.post(bill_analysis_url, json.dumps(query), **kwargs)
    logging.info("Response: {}\n{}".format(r.status_code, json.dumps(r.json(), indent=4)))
    r.raise_for_status()
    total_cost = 0
    for i in r.json()["rows"]:
        total_cost = total_cost + i["metrics"]["cost_amortized_blended_adj"]
    return total_cost

def plot_optima_data(optima_data):
    plot = []
    return plot


if __name__ == '__main__':
    # click passes no args
    # pylint: disable=no-value-for-parameter
    generate_cloud_cost_forecast()