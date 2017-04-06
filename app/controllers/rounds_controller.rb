class RoundsController < ApplicationController
	before_action :set_round, only: [:show, :update, :edit, :destroy, :add_players]

	def index
		@rounds = current_user.participating_rounds
		@created_rounds = current_user.created_rounds
		if @rounds.empty? && @created_rounds.empty?
			flash[:notice] = "You ain't got no rounds!"
			@player = current_user
			redirect_to player_path(current_user.id)
		end
	end

	def new
	  if current_user.eligible?
	  	@round = Round.new
	  else
	  	redirect_to root_path
	  end
	end

	def create
	  @round = Round.new(round_params)
	    if @round.save
	      redirect_to @round
	    else
	      redirect_to root_path
	    end
	end

	def show
	end

	def edit
	end

	def add_players
	end

	def update
		@round.update(round_params)
		if @round.active?
		  Poem.create(:user_id => @round.creator_id, :title => @round.title, 
		  	:round_id => @round.id, :line1_syllable_count => @round.line1_syllable_count, 
		  	:line2_syllable_count => @round.line2_syllable_count, :line3_syllable_count => @round.line3_syllable_count, 
		  	:line4_syllable_count => @round.line4_syllable_count, :line5_syllable_count => @round.line5_syllable_count, 
		  	:line6_syllable_count => @round.line6_syllable_count, :line7_syllable_count => @round.line7_syllable_count, 
		  	:line8_syllable_count => @round.line8_syllable_count, :line9_syllable_count => @round.line9_syllable_count, 
		  	:line10_syllable_count => @round.line10_syllable_count)
	      @round.poem_user_ids.each do |poet_id|
	        if poet_id != ""
              Poem.create(:user_id => poet_id, :title => @round.title, :round_id => @round.id, 
           :line1_syllable_count => @round.line1_syllable_count, :line2_syllable_count => @round.line2_syllable_count, :line3_syllable_count => @round.line3_syllable_count,
		   :line4_syllable_count => @round.line4_syllable_count, :line5_syllable_count => @round.line5_syllable_count, :line6_syllable_count => @round.line6_syllable_count,
		   :line7_syllable_count => @round.line7_syllable_count, :line8_syllable_count => @round.line8_syllable_count, :line9_syllable_count => @round.line9_syllable_count,
		   :line10_syllable_count => @round.line10_syllable_count)
            end
          end
        end
		redirect_to player_path(current_user.id)
	end

	def destroy
	end

	private 
    
    def set_round
    	@round = Round.find(params[:id])
    end

	def round_params
		params.require(:round).permit(:creator_id, :active, :title, :line_count, :line1_syllable_count, :line2_syllable_count, 
			:line3_syllable_count, :line4_syllable_count, :line5_syllable_count, :line6_syllable_count, :line7_syllable_count, 
			:line8_syllable_count, :line9_syllable_count, :line10_syllable_count, :poem_user_ids => [])
	end

end
