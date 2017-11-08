class ChannelScraper

	

	def initialize(api_key, org_system_id)
		path = "https://app.salsify.com/api/orgs/"
		channels = Faraday.new(path + org_system_id + "/channels")
  		channels.authorization :Bearer, api_key
  		response = channels.get

  		#puts response.body
  		json = JSON.parse(response.body)

  		parse_channels(json)



	end

	def parse_channels(json)
  		#total_entries
  		#channels -> channel_id
  		#		  -> name
  		# sv1 = obj['KEY1']['SUB_KEY1']


  		if(total_channels(json) =< per_page(json))
  			# we have only one page!
  			save_channels(json['channels'])
  		else
  			# we have many pages!

  		end
	end

	# get the json for a given channel
	def get_channel(org_system_id, page)
		channels = Faraday.new("https://app.salsify.com/api/orgs/" + org_system_id + "/channels")

	end

	def parse_page_of_channels(json, per_page, page, total_products)
		# scrape this page
		# if this page (per_page * page page) is not the last page (< total), call it again on the next page
		# if this page is the last page, exit
		save_channels_from_page(parse_channels(json))

		if page * per_page <= total_products
			# recursion
			parse_page_of_channels()


	end

	def save_channels_from_page(page)
		page.each do |channel|
  			puts channel['id']
  			puts channel['name']
  			s = Channel.new(channel['id'], channel['name'])
  			s.save
  		end

	end


	def total_channels(json)
		json['meta']['total_entries']
	end

	def per_page(json)
		json['meta']['per_page']
	end

	def get_page(json)
		json['meta']['page']
	end

end