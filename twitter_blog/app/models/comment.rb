class Comment < ApplicationRecord
  belongs_to :article
  belongs_to :user
  validates :body, presence: true, length: { maximum: 145 }

  def as_json(options = {})
    super(options.merge(include: :user))
  end
  
end
