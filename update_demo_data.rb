###############################################################################
# Required Libraries
###############################################################################

require 'uri'
require 'json'
require 'yaml'
require 'time'

###############################################################################
# Stored Dummy Data
###############################################################################

current_year = Time.now.year


###############################################################################
# Utility Methods
###############################################################################

def get_random_tags
  tag_list = [
    "environment=prod, app=paymentGateway",
    "environment=dev, app=dataAnalytics",
    "environment=prod, app=userManagement",
    "environment=dev, app=reportingService",
    "environment=staging, app=invoiceProcessing",
    "environment=prod, app=emailService",
    "environment=prod, app=securityModule",
    "environment=dev, app=inventoryManagement",
    "environment=prod, app=customerSupport",
    "environment=staging, app=crmModule"
  ]

  return tag_list.sample
end

def get_random_aws_account
  aws_account_list = [
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

  return aws_account_list.sample
end

def get_random_aws_region
  aws_region_list = [
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

  return aws_region_list.sample
end

def get_random_aws_region_pretty
  aws_region_list = [
    "EU (London)",
    "US East (N. Virginia)",
    "Asia Pacific (Mumbai)",
    "EU (Frankfurt)",
    "Asia Pacific (Tokyo)",
    "Asia Pacific (Sydney)",
    "US West (Oregon)",
    "EU (Ireland)",
    "EU (Paris)",
    "Asia Pacific (Singapore)"
  ]

  return aws_region_list.sample
end

def get_random_aws_ec2_size
  aws_ec2_type_list = [
    [ "c5n.xlarge",  "c4n.xlarge",  "c3n.xlarge"  ],
    [ "m6i.8xlarge", "m5i.8xlarge", "m4i.8xlarge" ],
    [ "r5.2xlarge",  "r4.2xlarge" , "r3.2xlarge"  ],
    [ "m5.8xlarge",  "m4.8xlarge",  "m3.8xlarge"  ],
    [ "r5.xlarge",   "r4.xlarge",   "r3.xlarge"   ],
    [ "c4n.xlarge",  "c3n.xlarge",  "c2n.xlarge"  ],
    [ "m5i.8xlarge", "m4i.8xlarge", "m3i.8xlarge" ],
    [ "r4.2xlarge",  "r3.2xlarge",  "r2.2xlarge"  ],
    [ "m4.8xlarge",  "m3.8xlarge",  "m2.8xlarge"  ],
    [ "c4n.xlarge",  "c3n.xlarge",  "c2n.xlarge"  ]
  ]

  return aws_ec2_type_list.sample
end

def get_random_name
  adjectives = [
    "quick", "lazy", "drowsy", "excited", "adventurous", "jolly", "brave", "calm",
    "eager", "fierce", "gentle", "happy", "innocent", "jovial", "kind", "lively",
    "merry", "nervous", "obedient", "proud", "relieved", "silly", "thankful",
    "upbeat", "vivacious", "witty", "excited", "youthful", "zealous", "quirky"
  ]

  animals = [
    "ant", "bear", "cat", "dog", "eel", "fox", "goat", "horse", "ibis", "jaguar",
    "kangaroo", "lion", "mouse", "newt", "owl", "penguin", "quail", "rabbit",
    "snake", "tiger", "urchin", "viper", "whale", "xerus", "yak", "zebra", "parrot",
    "octopus", "giraffe", "elephant"
  ]

  random_adjective = adjectives[rand(adjectives.length)]
  random_animal = animals[rand(animals.length)]

  return "#{random_adjective}#{random_animal}"
end

def get_random_time
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

  return times_list.sample
end

def get_random_date(year)
  start = Time.new(year, 1, 1) # Start from January 1st of the given year
  end_time = Time.new(year + 1, 1, 1) # End at December 31st of the given year
  random_time = start + rand(end_time - start) # Generate a random Time instance within the year

  return random_time.iso8601 # Return the ISO 8601 string representation of the random date
end


def write_demo_data(data, filepath)
  File.open(filepath, "w") do |file|
    file.write(JSON.pretty_generate(data))
  end
end

###############################################################################
# Demo Data Generation Methods
###############################################################################

def aws_compute_rightsizing_idle_data

end

###############################################################################
# Required Libraries
###############################################################################
