class Client
#TODO: add singleton

	# takes a salsify API token & org_system_id and creates a connection
	def initialize(org_system_id, api_token)
		path = "https://app.salsify.com/api/orgs/#{org_system_id}"
		@conn = Faraday.new(path) do |f|
			#f.response :logger  
			f.adapter  Faraday.default_adapter
			f.request  :url_encoded  
		end
  		@conn.authorization :Bearer, api_token
	end

	# get the API response for a given path & return it in JSON
	def get(path, params)

		response = @conn.get path, params
		JSON.parse(response.body)
	end

	def get_with_salsify_params(path, params)
		response = @conn.get path, params
		JSON.parse(response.body)

	end

	def encode_params(path, args = {})
	  args.map do |k,v|
	    "#{encode_component(k.to_s)}=#{encode_component(v.to_s)}" 
	  end.join("&")
	end


	# determine if we're on the last page of entries for a given query
	def on_last_page?(json = " ")
		# if we don't have the json (we haven't yet hit the API), we know we're on the
		# first page, so return false
		return false  if json == " "
			
		current_page(json) < total_pages(json) ? false : true	
	end


	def total_pages(json)
		total_entries(json) / per_page(json)
	end

	def total_entries(json)
		json['meta']['total_entries']
	end

	def per_page(json)
		json['meta']['per_page']
	end

	def current_page(json)
		json['meta']['current_page']
	end

end