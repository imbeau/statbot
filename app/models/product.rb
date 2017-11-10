class Product < ApplicationRecord
	belongs_to :channel

	validates :name, presence: true
	validates :product_id, presence: true, uniqueness: true
	
end
