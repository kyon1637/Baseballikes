class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image       
  enum like_team: {
  	特に無し:0, 巨人:1, DeNA:2, 阪神:3, 広島:4, 中日:5, ヤクルト:6,
    西武:7, ソフトバンク:8, 楽天:9, ロッテ:10, 日本ハム:11, オリックス:12
    }
  has_many :baseballs, dependent: :destroy  
end
