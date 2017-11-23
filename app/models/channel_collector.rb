class ChannelCollector 
	# this guy should orchestrate the entire channel collection process

	#should take an org_system_id & api_token for a valid salsify org
	def initialize(org, connection)
		@salsify = connection
		@org = org
		#ChannelInterface.new(org.system_id, org.api_token)

	end


	# actually go through and get the channels
	def get_channels

		#should return json of the first page of channels as a set of objects
		i = 1
		done = false
		new_channels = []

		until done do
			# get the first page of data, because we always need that
			current_page = @salsify.get('channels', {
														:page => i,
														:per_page => "50"
													})

			#determine the total number of pages
			total_pages = @salsify.get_total_pages(current_page)
			puts "we have #{total_pages} total pages to get through"

			#store the channels on this page
			new_channels += channels_to_objects(current_page)
			puts "completed page #{i}"


			# if we have no more pages to fetch, we're done!
			if(i >= total_pages)
				break
			end

			i += 1
		end

		new_channels

	end

	# Takes Adds each channel and its ID from the feed to an array
	# which it returns
	def channels_to_objects(json)
		channels = []
		json['channels'].each do |channel|
			channels.push(Channel.new(id: channel['id'], name: channel['name']))	
			puts "#{channel['id']} | #{channel['name']}"	
		end

		channels
	end

	def save_channels(new_channels)
		new_channels.each do |channel|
			channel.organization_id = @org.id
			puts channel.inspect
			#channel.save
		end
	end

end