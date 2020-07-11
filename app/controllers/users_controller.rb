class UsersController < ApplicationController
	def index
		@users = User.all.order(created_at: :desc)
		@user = User.new
		@baseball = Baseball.new
	end	
	def show
		@user = User.find(params[:id])
		@baseball = Baseball.find_by(id: params[:id])
		@baseball = Baseball.new
		@baseballs = @user.baseballs.reverse_order
	end

	def new
		@user = User.new
	end
	
	def edit
	    @user = User.find(params[:id])
	end
	
	def update
	    @user = User.find(params[:id])
	    if  @user.update(user_params)
	    	redirect_to user_path(@user)
	    else
	        render :edit
	    end
	end        	
	           	
	
private
    def user_params
  	    params.require(:user).permit(:name, :profile_image, :introduction, :like_team)
    end	

end
