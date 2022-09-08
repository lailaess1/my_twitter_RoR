class User < ApplicationRecord
    has_many :articles
    has_many :comments
    has_many :likes, dependent: :destroy
    has_many :retweets, dependent: :destroy
    has_many :messages
    # has_secure_password :transaction_password
    # acts_as_authentic
    before_save { self.email = email.downcase }

    # validates_confirmation_of :password
    validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/, message: "must be a valid address email"}
    validates :password, presence: true, confirmation: true, length: { minimum: 3 }
    validates :password_confirmation, presence: true
end