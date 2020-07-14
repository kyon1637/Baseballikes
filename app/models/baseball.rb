class Baseball < ApplicationRecord
	belongs_to :user
	attachment :baseball_image
	has_many :baseball_comments, dependent: :destroy
	has_many :favorites, dependent: :destroy
	def favorited_by?(user)
		favorites.where(user_id: user.id).exists?
	end	
    validates :title, presence: true
    validates :body, presence: true
end    