class Product < ApplicationRecord
	belongs_to :channel

	validates :name, presence: true
	validates :salsify_id, presence: true
	
end
