namespace :scrape do
  desc "Scrape channel data"
  task channels: :environment do

  	# use API key / channel path to scrape all the NEW channels
  	# eventually, let's store all of them in a database, for now let's do some insecure shit

  	api_key = "07100a600caa3aab8cb6a3886be041d100d421cfb7f09dbb17cd656de77f3db2"

  	org_id = "2317"

  	org_system_id = "s-0e999376-0caa-480d-9bac-a0d4ab2f86b3"

  	path = "https://app.salsify.com/api/orgs/"

  	ChannelScraper.new(api_key, org_system_id)
  	# https://github.com/lostisland/faraday
  	# curl 'https://app.salsify.com/api/orgs/s-0e999376-0caa-480d-9bac-a0d4ab2f86b3/channels' -X GET --header "Authorization: Bearer 07100a600caa3aab8cb6a3886be041d100d421cfb7f09dbb17cd656de77f3db2"

  	# set up our connection to scrape
  	#org = Farady.new(path + org_system_id)
  	#org.Authorization :Bearer, api_key

  	#so let's hit the channels routes

  	#let's store all the new channels (a new channel is a channel with an ID we haven't seen)




  end

  desc "Scrape product data"
  task scrape_products: :environment do

  	# use API key / product path to scrape all the NEW products
  	path = "https://app.salsify.com/app/orgs/s-0e999376-0caa-480d-9bac-a0d4ab2f86b3/products?filter=%3D%27salsify%3Apublication_status%27%3A%2754775%27%3Aproduct_type%3Aleaf"


  end

end
