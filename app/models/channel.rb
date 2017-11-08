class Channel < ApplicationRecord

	validates :name, presence: true
	validates :channel_id, presence: true, uniqueness: true
	validates :enabled, presence: true


end
