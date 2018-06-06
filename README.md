# GiveALittle

This project uses Ruby on Rails and several APIs (ReliefWeb: http://apidoc.rwlabs.org/, CharityNavigator: https://charity.3scale.net/, PandaPay: https://www.pandapay.io/, GoogleMaps: https://cloud.google.com/maps-platform/, and Twitter: https://developer.twitter.com/en/docs.html) to build a site that allows users to view information about natural disasters around the world, select an associated charity, make a donation, and view all donations that they have made. Users are able to log in locally and through Twitter oauth and tweet about their donation.
Brought to you by Adam Lusk.  

# Usage

To use this site, visit [here](https://givealittle.herokuapp.com/)<br>
If you're interested in using this in your own project, fork and clone this repository.  
From the root directory, run ```bundle install```.  
Next, initialize the database ```rake db:{install, migrate, seed}```  
Finally, open a ```rails server```  
and open http://localhost:3000/ on any browser.<br>
Run ```rspec``` to run the test suite

# Versions
ruby 2.4.1  
rails 5.1.6

# Next steps

* Improve the charity search algorithm by adding more search parameters

* Add filtering ability for disasters so user can search by type, number, country, etc.

* Add ability for users to search for charities without associating a disaster

* Add welcome email and email to thank user for donation

* Background workers for emails
