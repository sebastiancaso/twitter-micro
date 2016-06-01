#README

This is a JSON api backend that receives requests for tweets.  When a request is received, the application communicates with the Twitter api to retrieve recent tweets on the desired subject.

## Ruby version
Ruby 2.1.5

## System dependencies
This project depends on the Twitter api.  The initializer file for the Twitter api requires a consumer key and secret key, which is provided by Twitter.  You will need to register your application with Twitter at the [Twitter application page](https://apps.twitter.com/).  [This article](http://iag.me/socialmedia/how-to-create-a-twitter-app-in-8-easy-steps/) describes the app registering process very clearly.

## Configuration
To set up the application run `scripts/setup.sh`.  This will install the gems and create development and test databases.


## How to run the test suite
To run tests use the command `rspec`

## Deployment instructions
Capistrano 3 is used for deployment.  See [their github](https://github.com/capistrano/capistrano) repo for more information.



