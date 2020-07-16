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
    acts_as_taggable_on :labels
    acts_as_taggable

    def Baseball.search(search, user_or_baseball)
      if user_or_baseball == "2"
            Baseball.where(['title LIKE ?', "%#{search}%"])
      else
            Baseball.all
      end
    end
end    