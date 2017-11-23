class Product < ApplicationRecord
	belongs_to :channel

	validates :name, presence: true
	
end
