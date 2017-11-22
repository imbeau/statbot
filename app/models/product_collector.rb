class ProductCollector
	# product collector has to be invoked with a channel to scrape

	def initialize(org_system_id, api_token)
		@salsify = ChannelInterface.new(org_system_id, api_token)
	end

	# Take a channel_id and run through each page of products until we have them all
	# We use a specific parameter called "filter" which is parsed by Salsify to return the correct
	# set of products

	def get_products(channel_id)

		current_page = @salsify.get('products', 
												{
													:filter => "='salsify:publication_status':'#{channel_id}':product_type:leaf",
													:per_page => "50"
												})
	end
end