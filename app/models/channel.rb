class Channel < ApplicationRecord
	belongs_to :organization
	has_many :products

	validates :name, presence: true
	validates :enabled, presence: true

end
