class PlayersController < ApplicationController
	before_action :set_player, only: [:show, :update, :edit]

	def index
	end

	def show
		
	end

	def update
	end

	def edit
	end


	private

	def set_player
	  @player = User.find(current_user.id)
	end
end
