class ChannelScraper

	def initialize(api_key, org_system_id)

		# sets up connection
		conn = get_connection api_key, org_system_id
		puts "getting started!"
		 
		json = get_page_of_channels(conn, 1)

		#puts json
		save_channels_from_page(json)	

  		# until on_last_page?(json)
  		# 	i = 2
  		# 	json = get_page_of_channels(conn, i)
  		# 	save_channels_from_page(json)
  		# 	i++
  		# end
  		 
	end

	def get_connection(api_key, org_system_id)
		path = "https://app.salsify.com/api/orgs/#{org_system_id}"
		channels = Faraday.new(path)
  		channels.authorization :Bearer, api_key

  		return channels
	end

	# get the json for a given channel
	def get_page_of_channels(conn, page_number, per_page = 30)

		response = conn.get "channels", { :per_page => per_page, 
										   :page => page_number
										 } 
		response.body
		JSON.parse(response.body)
	end

	def save_channels_from_page(json)
		json['channels'].each do |channel|
  			print "#{channel['id']} | " 
  			print channel['name']
  			s = Channel.new(channel_id: channel['id'], name: channel['name'])
  			
  			if s.save
  				puts "...success!"
  			else
  				puts "...fail"
  			end
  		end

	end

	def on_last_page?(json)
		current_page(json) < total_pages(json) ? false : true
	end

	def total_pages(json)
		total_channels(json) / per_page(json)
	end

	def total_channels(json)
		json['meta']['total_entries']
	end

	def per_page(json)
		json['meta']['per_page']
	end

	def curent_page(json)
		json['meta']['page']
	end

end