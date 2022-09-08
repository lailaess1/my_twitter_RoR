class Like < ApplicationRecord
  belongs_to :article
  belongs_to :user

  # validates :number, presence: true

end
