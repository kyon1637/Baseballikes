class FavoritesController < ApplicationController

	def create
		@baseball = Baseball.find(params[:baseball_id])
		favorite = @baseball.favorites.new(user_id: current_user.id)
		favorite.save
		redirect_to baseball_path(@baseball)
	end
	
	def destroy
		@baseball = Baseball.find(params[:baseball_id])
		favorite = current_user.favorites.find_by(baseball_id: @baseball.id)
		favorite.destroy
		redirect_to baseball_path(@baseball)
	end	
end
