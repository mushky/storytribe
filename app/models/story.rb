class Story < ApplicationRecord
  belongs_to :user

  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true  

  def published?
    published_at?
	end
	  
end
