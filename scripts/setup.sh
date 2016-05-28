#!/bin/sh

echo "Setting Up Gems"
bundle install


echo "Setting Up Database"
echo "Would you like to completely reset the database (y/n)?"
read input

if [[ "$input" == "y" ]]; then
	bin/rake db:reset
else
	bin/rake db:create
	bin/rake db:migrate
	bin/rake db:migrate RAILS_ENV=test
fi