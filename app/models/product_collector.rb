class ProductCollector
	# product collector has to be invoked with a channel to scrape

	def initialize(connection, channels = nil)
		@salsify = connection
		@channels = channels
	end

	# Take a channel_id and run through each page of products until we have them all
	# We use a specific parameter called "filter" which is parsed by Salsify to return the correct
	# set of products

	def get_products_from_channel(channel_id)
		if channel_id == nil
			puts "WARNING: Please specify a channel ID"
			return
		end

		i = 1
		done = false
		new_products = []

		until done do
			current_page = @salsify.get('products', 
													{
														:filter => "='salsify:publication_status':'#{channel_id}':product_type:leaf",
														:page => i,
														:per_page => "50"
													})	
		total_pages = @salsify.get_total_pages(current_page)
		puts "we have #{total_pages} pages to get through!"
		new_products += products_to_objects(current_page, channel_id)		

			# if we have no more pages to fetch, we're done!
			if(i >= total_pages)
				done = true
			else
				i += 1
			end			
		end

		new_products
	end

	def get_products
		i = 1
		done = false
		new_products = []

		until done do
			current_page = @salsify.get('products',
						{
							:page => i,
							:per_page => "100"
						}
					)

			total_pages = @salsify.get_total_pages(current_page)
			puts "we are on #{@salsify.get_current_page(current_page)} of #{total_pages} pages to get through!"
			new_products += products_to_objects(current_page)

			i >= total_pages ? break : i+= 1
		end

		puts "we fetched #{new_products.count}"
	end

	def products_to_objects(json, channel_id = 0)
		products = []
		json['products'].each do |product|
			if channel_id == 0
				products.push(Product.new(channel_id: channel_id, salsify_id: product['id'], name: product['name']))
			else
				products.push(Product.new(salsify_id: product['id'], name: product['name']))
			end
		end

		products
	end	

	def get_total_products
		@salsify.total_entries(@salsify.get('products'))
	end

	def save_products(new_products)
		new_products.each do |product|
			puts "saving #{product.id}"
			product.save
		end
	end
end