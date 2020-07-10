class Baseball < ApplicationRecord
	belongs_to :user
	attachment :baseball_image
end
