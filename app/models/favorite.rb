class Favorite < ApplicationRecord
	belongs_to :user
	belongs_to :baseball
	validates_uniqueness_of :baseball_id, scope: :user_id
end
