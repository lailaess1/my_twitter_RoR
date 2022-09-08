class Message < ApplicationRecord
  belongs_to :user

  validates :receiver, presence: true
  validates :body, presence: true
end
