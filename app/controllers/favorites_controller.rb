class FavoritesController < ApplicationController

	def create
		@baseball = Baseball.find(params[:baseball_id])
		@favorite = @baseball.favorites.new(user_id: current_user.id)
		@favorite.save
	end

	def destroy
		@baseball = Baseball.find(params[:baseball_id])
		@favorite = current_user.favorites.find_by(baseball_id: @baseball.id)
		@favorite.destroy
	end	
end
