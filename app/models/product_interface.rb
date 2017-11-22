class ProductInterface < Client

	def fetch_products(json, channel_id)
		products = []
		json['products'].each do |product|
			products.push(Product.new(channel_id: channel_id, product_id: product['id'], name: channel['name']))		
		end

		puts products

		products
	end
end