class Client
#TODO: add singleton

	# takes a salsify API token & org_system_id and creates a connection
	def initialize(org)
		path = "https://app.salsify.com/api/orgs/#{org.system_id}"
		@conn = Faraday.new(path) do |f|
			#f.response :logger  
			f.adapter  Faraday.default_adapter
			f.request  :url_encoded  
		end
  		@conn.authorization :Bearer, org.api_token
	end

	# get the API response for a given path & return it in JSON
	def get(path, params)

		response = @conn.get path, params
		JSON.parse(response.body)
	end


	# determine if we're on the last page of entries for a given query
	def on_last_page?(json = " ")
		# if we don't have the json (we haven't yet hit the API), we know we're on the
		# first page, so return false
		return false  if json == " "
			
		current_page(json) < total_pages(json) ? false : true	
	end


	def get_total_pages(json)
		total_entries = json['meta']['total_entries']
		entries_per_page = json['meta']['per_page']


		total_entries / entries_per_page
	end

	def get_current_page(json)
		json['meta']['current_page']
	end

end