# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image
  enum like_team: {
    特に無し: 0, 巨人: 1, DeNA: 2, 阪神: 3, 広島: 4, 中日: 5, ヤクルト: 6,
    西武: 7, ソフトバンク: 8, 楽天: 9, ロッテ: 10, 日本ハム: 11, オリックス: 12
  }
  has_many :baseballs, dependent: :destroy
  validates :name, presence: true, length: { minimum: 2, maximum: 20 }
  has_many :baseball_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorite_baseballs, through: :favoritres, source: :baseball
  has_many :relationships
  has_many :followings, through: :relationships, source: :follow
  has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
  has_many :followers, through: :reverse_of_relationships, source: :user
  has_many :messages, dependent: :destroy
  has_many :entries, dependent: :destroy

  def follow(other_user)
    relationships.find_or_create_by(follow_id: other_user.id) unless self == other_user
  end

  def unfollow(other_user)
    relationship = relationships.find_by(follow_id: other_user.id)
    relationship&.destroy
  end

  def following?(other_user)
    followings.include?(other_user)
  end

  def self.search(search, user_or_baseball)
    if user_or_baseball == '1'
      User.where(['name LIKE ?', "%#{search}%"])
    else
      User.all
    end
  end

  def already_favorited?(baseball)
    favorites.exists?(baseball_id: baseball.id)
  end
end
