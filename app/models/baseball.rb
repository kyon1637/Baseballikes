# frozen_string_literal: true

class Baseball < ApplicationRecord
  belongs_to :user
  attachment :baseball_image
  has_many :baseball_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favoriting_users, through: :favorites, source: :user
  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
  validates :title, presence: true
  validates :body, presence: true
  acts_as_taggable_on :labels
  acts_as_taggable

  def self.search(search, user_or_baseball)
    if user_or_baseball == '2'
      Baseball.where(['title LIKE ?', "%#{search}%"])
    else
      Baseball.all
    end
  end

  def self.create_all_ranks
    　　Baseball.find(Favorite.group(:baseball_id).order('count(baseball_id) desc').limit(3).pluck(:baseball_id))
    　end
  end
end
