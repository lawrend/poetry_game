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
             Poem.create(:user_id => poet_id, :title => @round.title, :line_count => @round.line_count, :round_id => @round.id,
             :line1_syllables => @round.line1_syllables, :line2_syllables => @round.line2_syllables, :line3_syllables => @round.line3_syllables,
             :line4_syllables => @round.line4_syllables, :line5_syllables => @round.line5_syllables, :line6_syllables => @round.line6_syllables,
             :line7_syllables => @round.line7_syllables, :line8_syllables => @round.line8_syllables, :line9_syllables => @round.line9_syllables,
			:line10_syllables => @round.line10_syllables)
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
		params.require(:round).permit(:creator_id, :title, :line_count, :line1_syllables, :line2_syllables, 
			:line3_syllables, :line4_syllables, :line5_syllables, :line6_syllables, :line7_syllables, :line8_syllables, :line9_syllables,
			:line10_syllables, :poem_user_ids => [])
	end

end
