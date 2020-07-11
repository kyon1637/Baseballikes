class BaseballsController < ApplicationController
	def new
		@baseball = Baseball.new
	end

	def create
		@baseball = Baseball.new(baseball_params)
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
		@baseball = Baseball.find(params[:id])
		@user = User.find_by(id: @baseball.user_id)
	end

	def edit
		@baseball = Baseball.find(params[:id])
	end

	def update
		@baseball = Baseball.find(params[:id])
		if  @baseball.update(baseball_params)
		    redirect_to baseball_path(@baseball.id)
		else
			render 'edit'
		end
	end		
		    	

	def destroy
		@baseball = Baseball.find(params[:id])
		@baseball.destroy
		redirect_to baseballs_path
	end

private
	def baseball_params
	    params.require(:baseball).permit(:title, :body, :baseball_image)
	end     	
end
