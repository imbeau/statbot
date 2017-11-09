class Channel < ApplicationRecord

	validates :name, presence: true
	validates :channel_id, presence: true, uniqueness: true
	validates :enabled, presence: true


	#attr_accessor :name, :channel_id, :enabled

	def initialize(attributes = {})
		super(attributes)

		@name = attributes[:name]
		@channel_id = attributes[:channel_id]

	end


end
