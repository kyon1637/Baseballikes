class BaseballsController < ApplicationController
	def new
		@user = current_user
		@baseball = Baseball.new
	end

	def create
		@baseball = Baseball.new(baseball_params)
		@baseball.user_id = current_user.id
	    if @baseball.save
	       redirect_to user_path(current_user)
	    else
	       render 'new'
	    end      	
	end

	def	index
		@user = User.find_by(id: current_user)
		@baseball = Baseball.new
		@baseballs = Baseball.all.order(created_at: :desc)
		@usernew = User.new
	end
	
	def show
		@baseball = Baseball.find(params[:id])
		@user = User.find_by(id: @baseball.user_id)
		@baseball_comment = BaseballComment.new
		@baseball_comments = @baseball.baseball_comments.order(created_at: :desc)
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
		redirect_to user_path(current_user.id)
	end

private
	def baseball_params
	    params.require(:baseball).permit(:title, :body, :baseball_image, :tag_list)
	end
end
