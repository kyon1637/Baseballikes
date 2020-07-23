class BaseballsController < ApplicationController
	before_action :authenticate_user!
	before_action :correct_user, only: [:edit, :update]
	def new
		@user = current_user
		@baseball = Baseball.new
	end

	def create
		@baseball = Baseball.new(baseball_params)
		@baseball.user_id = current_user.id
	    if @baseball.save
	       redirect_to user_path(current_user), notice: '投稿が完了しました'
	    else
	       render 'new'
	    end      	
	end

	def	index
		@user = User.find_by(id: current_user)
		@baseball = Baseball.new
		@baseballs = Baseball.page(params[:page]).per(7)
		@usernew = User.new
		@tags = Baseball.tag_counts_on(:tags).order('count DESC')
		@all_ranks = Baseball.find(Favorite.group(:baseball_id).order('count(baseball_id) desc').limit(5).pluck(:baseball_id))
		if params[:tag_name]
		@baseballs = Baseball.page(params[:page]).per(7).tagged_with("#{params[:tag_name]}")
		end   
	end
	
	def show
		@baseball = Baseball.find(params[:id])
		@user = User.find_by(id: @baseball.user_id)
		@favorite = Favorite.new
		@baseball_comment = BaseballComment.new
		@baseball_comments = @baseball.baseball_comments.order(created_at: :desc)
	end

	def edit
		@baseball = Baseball.find(params[:id])
	end

	def update
		@baseball = Baseball.find(params[:id])
		if  @baseball.update(baseball_params)
		    redirect_to baseball_path(@baseball.id), notice: '投稿を編集しました'
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

    def correct_user
    	@baseball = current_user.baseballs.find_by(id: params[:id])
       unless @baseball
       	redirect_to user_path(current_user.id)
       end
    end
end
