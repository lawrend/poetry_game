class RoundsController < ApplicationController
	before_action :set_round, only: [:show, :update, :edit, :destroy, :add_players]

	def index
		@player_rounds = current_user.rounds_as_player
		@created_rounds = current_user.created_rounds
		@created_and_active_open = current_user.created_and_active_and_open
		@created_and_inactive = current_user.created_and_inactive
		@player_rounds_with_non_submitted = current_user.player_rounds_with_non_submitted_poem
		@created_not_open_rounds_with_non_submitted = current_user.created_and_not_open_with_non_submitted_poem
		@player_rounds_with_submitted = current_user.player_rounds_with_submitted_poems
		@created_rounds_not_open_with_submitted = current_user.created_and_not_open_with_submitted_poem
	end

	def new
	  if current_user.eligible?
	  	@round = Round.new
	  else
	  	flash[:notice] = "You aren't eligible. Change your Maximum Rounds or Availability."
	  	redirect_to root_path
	  end
	end

	def create
	  @round = Round.new(round_params)
	    if @round.save
	      redirect_to edit_round_path(@round.id)
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
		if params[:commit] == "Generate Lines"
			@round.update(round_params)
			redirect_to edit_round_path(@round.id)
		elsif params[:commit] == "Update Lines"
			@round.update(round_params)
			if @round.line_count < 10
				@round.redo_lines
			end
			redirect_to edit_round_path(@round.id)
		else
			@round.update(round_params)
			if @round.check_for_zeroes?
				flash[:notice] = "You cannot leave a line with zero syllables. Either adjust syllable count or reduce overall number of lines."
				redirect_to edit_round_path(@round.id)
			else
				if @round.active?
					if @round.poems.where(:user_id => @round.creator_id).blank?
				  		Poem.create(:user_id => @round.creator_id, :title => @round.title, 
				  		:round_id => @round.id, :line1_syllable_count => @round.line1_syllable_count, 
					  	:line2_syllable_count => @round.line2_syllable_count, :line3_syllable_count => @round.line3_syllable_count, 
					  	:line4_syllable_count => @round.line4_syllable_count, :line5_syllable_count => @round.line5_syllable_count, 
					  	:line6_syllable_count => @round.line6_syllable_count, :line7_syllable_count => @round.line7_syllable_count, 
					  	:line8_syllable_count => @round.line8_syllable_count, :line9_syllable_count => @round.line9_syllable_count, 
					  	:line10_syllable_count => @round.line10_syllable_count)
					end
					if @round.poem_user_ids != nil
				      	@round.poem_user_ids.each do |poet_id|
				        	if poet_id != "" && @round.poems.where(:user_id => poet_id).blank?
			              		Poem.create(:user_id => poet_id, :title => @round.title, :round_id => @round.id, 
					           :line1_syllable_count => @round.line1_syllable_count, :line2_syllable_count => @round.line2_syllable_count, :line3_syllable_count => @round.line3_syllable_count,
							   :line4_syllable_count => @round.line4_syllable_count, :line5_syllable_count => @round.line5_syllable_count, :line6_syllable_count => @round.line6_syllable_count,
							   :line7_syllable_count => @round.line7_syllable_count, :line8_syllable_count => @round.line8_syllable_count, :line9_syllable_count => @round.line9_syllable_count,
							   :line10_syllable_count => @round.line10_syllable_count)
			            	end
			            end
		        	end
		        end
		    redirect_to round_path(@round.id)
		    end
		end
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
