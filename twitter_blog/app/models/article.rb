class Article < ApplicationRecord
  belongs_to :user
  has_many :comments
  has_many :likes, dependent: :destroy
  has_many :retweets, dependent: :destroy

  validates :body, presence: true, length: { maximum: 145 }
end