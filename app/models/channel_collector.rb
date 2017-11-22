class ChannelCollector 
	# this guy should orchestrate the entire channel collection process

	#should take an org_system_id & api_token for a valid salsify org
	def initialize(org_system_id, api_token)
		@salsify = ChannelInterface.new(org_system_id, api_token)
	end


	# actually go through and get the channels
	def get_channels

		#should return json of the first page of channels as a set of objects
		i = 1
		json = " "
		done = false
		new_channels = []

		until done do
			# get the first page of data, because we always need that
			current_page = @salsify.get('channels', {
														:page => i
														:per_page => "50"
													})

			#determine the total number of pages
			total_pages = @salsify.total_pages(current_page)
			puts "we have #{total_pages} total pages to get through"

			#store the channels on this page
			new_channels += @salsify.fetch_channels(current_page)
			byebug
			puts "completed page #{i}"


			# if we have no more pages to fetch, we're done!
			if(i >= total_pages)
				done = true
			else
				i += 1
			end
		end

		new_channels

	end

	def save_channels(new_channels)
		new_channels.each do |channel|
			channel.save
		end
	end

end