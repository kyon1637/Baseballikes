class BaseballCommentsController < ApplicationController
   before_action :authenticate_user!
	def create
		@baseball = Baseball.find(params[:baseball_id])
		@baseball_comment = @baseball.baseball_comments.new(baseball_comment_params)
        @baseball_comment.user_id = current_user.id
		@baseball_comment.save
	end

	def destroy
		@baseball_comment = BaseballComment.find(params[:id])
		@baseball_comment.destroy
	end

	private
	def baseball_comment_params
		params.require(:baseball_comment).permit(:comment, :baseball_id, :user_id)
	end
end
