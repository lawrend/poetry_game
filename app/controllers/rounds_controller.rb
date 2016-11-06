class RoundsController < ApplicationController
	before_action :set_round, only: [:show, :update, :edit, :destroy]

	def index
		@rounds = current_user.participating_rounds
		if @rounds.empty?
			flash[:notice] = "You ain't got no rounds!"
			@player = current_user
			redirect_to player_path(current_user.id)
		end
	end

	def new
	  @round = Round.new	  
	end

	def create
	  @round = Round.new(round_params)
	    if @round.save
	      @round.poem_user_ids.each do |poet_id|
	      	if poet_id != ""
             Poem.create(:user_id => poet_id, :title => @round.title, :line_count => @round.line_count, :round_id => @round.id)
            end
          end
	      redirect_to @round
	    else
	      redirect_to root_path
	    end
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
		params.require(:round).permit(:creator_id, :title, :line_count, :poem_user_ids => [])
	end

end
