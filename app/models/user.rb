class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
	before_create :default_regular_user
  devise :masqueradable, :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :omniauthable

  has_many :notifications, foreign_key: :recipient_id
  has_many :services
  has_many :stories, dependent: :destroy


	def default_regular_user
		self.role = 'regular'
	end

	def admin?
    role == "admin"
	end 

	def regular?
    role == "regular"
	end 

	def guest?
    role == "guest"
	end
	
end
