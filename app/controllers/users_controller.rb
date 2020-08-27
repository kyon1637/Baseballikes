class UsersController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	def index
		@users = User.all.page(params[:page]).per(7)
		@user = User.new
		@baseball = Baseball.new
	end	
	def show
		@user = User.find(params[:id])
		@currentUserEntry = Entry.where(user_id: current_user.id)
        @userEntry = Entry.where(user_id: @user.id)
        if  @user.id == current_user.id
        else
            @currentUserEntry.each do |cu|
            @userEntry.each do |u|
           if cu.room_id == u.room_id then
              @isRoom = true
              @roomId = cu.room_id
          end
        end
        end
        if @isRoom
        else
           @room = Room.new
           @entry = Entry.new
        end
        end
		@baseball = Baseball.find_by(id: params[:id])
		@baseball = Baseball.new
		@baseballs = @user.baseballs.page(params[:page]).per(7)
	end

	def favorites
		  @user = User.find_by(id: params[:id])
		  @favorites = Favorite.where(user_id: @user.id)
	end

  def follows
      @user = User.find(params[:id])
  end

  def followers
      @user = User.find(params[:id])
  end

	def edit
	    @user = User.find(params[:id])
	end

	def update
	    @user = User.find(params[:id])
	    if  @user.update(user_params)
	    	redirect_to user_path(@user), notice: 'プロフィールを編集しました'
	    else
	        render :edit
	    end
	end

	def search
	    @user_or_baseball = params[:option]
        if    @user_or_baseball == "1"
              @users = User.search(params[:search], @user_or_baseball)
        else
              @baseballs = Baseball.search(params[:search], @user_or_baseball)
        end
	end

private
    def user_params
  	    params.require(:user).permit(:name, :profile_image, :introduction, :like_team)
    end

    def correct_user
    	@user = User.find(params[:id])
       if current_user != @user
       	redirect_to user_path(current_user.id)
       end
    end
end
