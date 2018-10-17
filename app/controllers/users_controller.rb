class UsersController < ApplicationController
	#before_action :authenticate_user!

	attr_accessor :user

	def show
		@user = User.find(params[:id])
	end

	def stories
		@stories ||= user.stories
	end

end
