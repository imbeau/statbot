class Product < ApplicationRecord

	validates :name, presence: true
	validates :product_id, presence: true
	
end
