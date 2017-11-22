class ChannelInterface < Client


	# gets a JSON feed. Adds each channel and its ID from the feed to an array
	# which it returns
	def fetch_channels(json)
		channels = []
		json['channels'].each do |channel|
			channels.push(Channel.new(channel_id: channel['id'], name: channel['name']))		
		end

		puts channels

		channels
	end
end