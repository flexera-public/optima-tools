# Demo Policies

## What These Are

These policies are intended to emulate their counterparts in the policy catalog for the purposes of producing Recommendations. They rely on dummy data instead of pulling data from an actual cloud provider, and offer no actual functionality, such as the ability to take action on resources. Their purpose is to populate a demo environment with Recommendations data.

## How To Use

Upload the desired policies to your demo environment in Flexera One and apply. The policies require no credentials and will automatically pull demo data from this repository. Allow ~24 hours for this demo data to be reflected in Flexera One.

## Technical Details

- No credentials are required to use these policies. The only datasources they contain pull data from this repository, which is public and therefore requires no authentication.
- The incidents the policies raise are identical to their catalog counterparts, so they can be used to demo the incidents in addition to the Optimization dashboard.
- These are not fully functioning policies and should not be used to demonstrate how to apply these policies, what parameters the policies have, or to demonstrate how to take action against resources.
- The metadata and version number for the demo policy is equivalent to its counterpart in the policy catalog, with the exception of the name, which has " [Demo]" appended to it to distinguish it from the catalog versions of these same policies.

## Data Generation

- The `./update_demo_data.rb` script is used to generate the demo data. Demo data is stored in the `./flexera/data` directory.
- The `./update_demo_data.rb` script runs automatically on a weekly cadence via Github actions and stores the updated demo data in the `task/update-cco-demo-data` branch. This branch is where the policies pull the data from.
