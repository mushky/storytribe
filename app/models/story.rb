class Story < ApplicationRecord
  belongs_to :user
  has_many :likes

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true  

  def published?
    published_at?
	end
	  
end
