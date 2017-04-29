class Idea < ApplicationRecord
  belongs_to :user
  has_many :users
  has_many :users, through: :likes
  has_many :idea_likes, through: :likes, source: :user
  has_many :likes, dependent: :destroy
  validates :idea, length: { minimum: 5 }
end
