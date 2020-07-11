class Baseball < ApplicationRecord
	belongs_to :user
	attachment :baseball_image
    validates :title, presence: true
    validates :body, presence: true
end    