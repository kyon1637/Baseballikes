class BaseballCommentsController < ApplicationController

	def create
		@baseball = Baseball.find(params[:baseball_id])
		@baseball_comment = @baseball.baseball_comments.new(baseball_comment_params)
        @baseball_comment.user_id = current_user.id
		@baseball_comment.save
		redirect_to baseball_path(@baseball)
	end
	
	def destroy
		@baseball_comment = BaseballComment.find(params[:baseball_id])
		@baseball_comment.destroy
	end	

	private
	def baseball_comment_params
		params.require(:baseball_comment).permit(:comment)
	end	
end
