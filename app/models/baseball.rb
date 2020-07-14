class Baseball < ApplicationRecord
	belongs_to :user
	attachment :baseball_image
	has_many :baseball_comments, dependent: :destroy
    validates :title, presence: true
    validates :body, presence: true
end    