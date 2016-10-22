class RoundsController < ApplicationController
	before_action :set_round, :only [:show, :update, :edit, :destroy]

	def index
	end

	def new
	end

	def create
	end

	def show
	end

	def edit
	end

	def update
	end

	def destroy
	end

	private 
    
    def set_round
    	@round = Round.find(params[:id])
    end

	def round_params
		params.require(:round).permit(:creator_id, :participants)
	end

end
