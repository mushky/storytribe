class UsersController < ApplicationController
	attr_accessor :user

	def show
		@user = User.find(params[:id])
	end

	def stories
		@stories ||= user.stories
	end

end
