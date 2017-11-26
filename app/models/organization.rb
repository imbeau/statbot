class Organization < ApplicationRecord
	has_many :channels, dependent: :destroy
	has_many :organization_snapshots, dependent: :destroy

	validates :name, presence: true
	validates :api_token, presence: true
	validates :system_id, presence: true

	# enabled_channels returns a list of channels where the enabled flag is set to true. 
	# This method gets you list of channels we actually want to get product data from.


	def enabled_channels

	end


end