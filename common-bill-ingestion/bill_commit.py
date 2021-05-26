#!/usr/bin/env python3
'''
Basic Bill Upload example
---------------------------
Creates a bill upload, uploads a file, then commits that bill_upload.
Note: it's OK to create a new upload for a given org_id, bill connect and period,
provided any previous one (for that same org_id/bill connect/period) has been committed (or aborted).

Usage: ./bill_commit.py <refresh_token> <org_id> <bill_upload_id> <operation_status>(commit|abort)

Parameters:
<refresh token>:   obtained from Cloud Management:
                   - go to Settings, then API Credentials in the Account Settings;
                   - enable the token and pass its value to this script.
<org_id>:          the relevant organization id, e.g. "25667"
<bill_upload_id>:  Bill Upload Id to commit or abort
<operation_status>: commit or abort
'''
import json
import logging
import requests
import sys

# Tweak the destination (e.g. sys.stdout instead) and level (e.g. logging.DEBUG instead) to taste!
logging.basicConfig(format='%(levelname)s:%(asctime)s:%(message)s', stream=sys.stderr, level=logging.INFO)

if len(sys.argv) < 5:
    logging.error('Missing command-line options!!!')
    print(__doc__)
    sys.exit(1)

refresh_token, org_id, bill_upload_id, operation_status = sys.argv[1:]
logging.info("Using org_id: {}, bill_upload_id: {}, status: {}".format(
             org_id, bill_upload_id, operation_status))

token_url = "https://login.flexera.com/oidc/token"
bill_upload_url = "https://api.optima.flexeraeng.com/optima/orgs/{}/billUploads".format(org_id)

logging.info("OAuth2: Getting Access Token via Refresh Token...")
r = requests.post(token_url, data={"grant_type": "refresh_token", "refresh_token": refresh_token})
r.raise_for_status()
access_token = r.json()["access_token"]

# ===== Use Access Token as Bearer token from them on ===== #
auth_headers = {"Authorization": "Bearer " + access_token}
kwargs = {"headers": auth_headers, "allow_redirects": False}

logging.info("3. Committing the Bill Upload {}...".format(bill_upload_id))
operations_url = "{}/{}/operations".format(bill_upload_url, bill_upload_id)
r = requests.post(operations_url, '{"operation":"abort"}', **kwargs)
logging.info("Response: {}\n{}".format(r.status_code, json.dumps(r.json(), indent=4)))
r.raise_for_status()

# ===== That's all, folks! =====
sys.exit(0)
