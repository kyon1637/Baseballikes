class BaseballsController < ApplicationController
	def new
		@baseball = Baseball.new
	end

	def create
		@baseball = Baseball.new(baseball_params)
		@baseball.user = current_user
	    if @baseball.save
	       redirect_to user_path(current_user)
	    else
	       render 'new'
	    end      	
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

private
	def baseball_params
	    params.require(:baseball).permit(:title, :body, :baseball_image)
	end     	
end
