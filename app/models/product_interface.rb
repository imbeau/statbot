class ProductInterface < Client

	def fetch_products(json, channel_id)
		products = []
		json['products'].each do |product|
			products.push(Product.new(channels_id: channel_id, id: product['id'], name: product['name']))		
		end

		products
	end
end