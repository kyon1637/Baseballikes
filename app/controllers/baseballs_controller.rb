class BaseballsController < ApplicationController
	def new
	end

	def create
	end

	def	index
		@baseball = Baseball.new
		@baseballs = Baseball.all
		@user = User.new
	end
	
	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end	
end
