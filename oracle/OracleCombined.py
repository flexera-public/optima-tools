'''
This script downloads all of the cost, usage, (or both) reports for a tenancy (specified in the config file).

Pre-requisites: Create an IAM policy to endorse users in your tenancy to read cost reports from the OCI tenancy.

Example policy:
define tenancy reporting as ocid1.tenancy.oc1..aaaaaaaaned4fkpkisbwjlr56u7cj63lf3wffbilvqknstgtvzub7vhqkggq
endorse group group_name to read objects in tenancy reporting

Note - The only value you need to change is the group name. Do not change the OCID in the first statement.
'''

import oci
import os
from datetime import datetime
from dateutil.relativedelta import relativedelta
import pytz
import json
from collections import defaultdict
import gzip
import logging
import requests
import sys
import time

reporting_namespace = 'bling'

# Download all usage and cost files. You can comment out based on the specific need:
prefix_file = "reports/cost-csv"                     #  For cost and usage files
# prefix_file = "reports/cost-csv"   #  For cost
# prefix_file = "reports/usage-csv"  #  For usage

# Update these values
destination_path = 'CBI'

# Download all file or just past three months.
download_all_files = os.environ.get("DOWNLOAD_ALL", False)

# Make a directory to receive reports
if not os.path.exists(destination_path):
    os.mkdir(destination_path)

# Get the list of reports
config = oci.config.from_file(oci.config.DEFAULT_LOCATION, oci.config.DEFAULT_PROFILE)
reporting_bucket = config['tenancy']
object_storage = oci.object_storage.ObjectStorageClient(config)
report_bucket_objects = object_storage.list_objects(reporting_namespace, reporting_bucket, prefix=prefix_file, fields='name,etag,timeCreated,md5,timeModified,storageTier,archivalState')

# Do date stuff
utc=pytz.UTC
now = datetime.now()
last_three_months = utc.localize(now) + relativedelta(months=-3)

# set downloaded_files array for upload
downloaded_files = []

for o in report_bucket_objects.data.objects:
  if download_all_files:
    download = True
  elif o.time_modified >= last_three_months:
    print("Downloading files from " + last_three_months.strftime("%Y-%m") + " to " + now.strftime("%Y-%m"))
    download = True
  else:
    download = False

  if download:
    print('Found file ' + o.name)
    folder_time = o.time_modified.strftime("%Y-%m")
    download_folder = os.path.join(destination_path,folder_time)
    # Make a directory to receive reports
    if not os.path.exists(download_folder):
      os.mkdir(download_folder)

    filename = os.path.basename(o.name)
    written_file_name = os.path.join(download_folder, filename)
    downloaded_files.append(written_file_name)

    if not os.path.exists(written_file_name):
      object_details = object_storage.get_object(reporting_namespace, reporting_bucket, o.name)

      with open(written_file_name, 'wb') as f:
          for chunk in object_details.data.raw.stream(1024 * 1024, decode_content=False):
              f.write(chunk)

      print('----> File ' + o.name + ' Downloaded')

# https://stackoverflow.com/questions/18208898/concatenate-gzipped-files-with-python-on-windows
my_dict = defaultdict(list)

for f in downloaded_files:
  my_dict[f[:12]].append(f)

concatenatedFiles = []
for key in my_dict.keys():
  destFilename = os.path.join(key, "concatenated.csv.gz")
  concatenatedFiles.append(destFilename)

  with gzip.open(destFilename, 'wb') as destFile:
    counter = 0
    for fileName in my_dict[key]:
      with gzip.open(fileName, 'rb') as sourceFile:
        for chunk in sourceFile.readlines()[counter:]:
          destFile.write(chunk)
      counter =  1

with open('files.json','w') as outfile:
    json.dump(concatenatedFiles, outfile, indent=2)

# Upload Section

# Tweak the destination (e.g. sys.stdout instead) and level (e.g. logging.DEBUG instead) to taste!
logging.basicConfig(format='%(levelname)s:%(asctime)s:%(message)s', stream=sys.stderr, level=logging.INFO)

refresh_token = os.environ.get('REFRESH_TOKEN')
org_id = os.environ.get('ORG_ID')
bill_connect_id = os.environ.get("BILL_CONNECT_ID")
shard = os.environ.get("SHARD")

if not shard == '3':
  if not shard == '4':
    logging.error('Invalid Shard Number ' + shard)
    sys.exit(1)

token_url = "https://us-"+ shard +".rightscale.com/api/oauth2"
bill_upload_url = "https://optima-bill-upload-front.indigo.rightscale.com/optima/orgs/{}/billUploads".format(org_id)

logging.info("OAuth2: Getting Access Token via Refresh Token...")
r = requests.post(token_url, data={"grant_type": "refresh_token", "refresh_token": refresh_token}, headers={"X-API-Version": "1.5"})
r.raise_for_status()
access_token = r.json()["access_token"]

# ===== Use Access Token as Bearer token from them on ===== #
auth_headers = {"Authorization": "Bearer " + access_token}
kwargs = {"headers": auth_headers, "allow_redirects": False}

# uploading files to endpoint
dir_path =  os.path.dirname(os.path.realpath(__file__))
json_file = os.path.join(dir_path, 'files.json')

with open(json_file) as f:
  data = json.load(f)

for filename in data:
  period = filename.split('\\')[1]
  logging.info("Using org_id {}, bill_connect_id {}, period {}".format(
             org_id, bill_connect_id, period))
  logging.info("1. Creating Bill Upload for Period:" + period)
  bill_upload = {"billConnectId": bill_connect_id, "billingPeriod": period}
  r = requests.post(bill_upload_url, json.dumps(bill_upload), **kwargs)
  logging.info("Response: {}\n{}".format(r.status_code, json.dumps(r.json(), indent=4)))
  r.raise_for_status()
  bill_upload_id = r.json()["id"]

  base_name = os.path.basename(filename)
  logging.info("2. Upload file {} to Bill Upload {}...".format(base_name, bill_upload_id))
  upload_file_url = "{}/{}/files/{}".format(bill_upload_url, bill_upload_id, base_name)
  r = requests.post(upload_file_url, data=open(filename, 'rb').read(), **kwargs)
  logging.info("Response: {}\n{}".format(r.status_code, json.dumps(r.json(), indent=4)))

  logging.info("3. Committing the Bill Upload {}...".format(bill_upload_id))
  operations_url = "{}/{}/operations".format(bill_upload_url, bill_upload_id)
  r = requests.post(operations_url, '{"operation":"commit"}', **kwargs)
  logging.info("Response: {}\n{}".format(r.status_code, json.dumps(r.json(), indent=4)))
  r.raise_for_status()

# ===== That's all, folks! =====
sys.exit(0)