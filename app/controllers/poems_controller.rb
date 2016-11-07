class PoemsController < ApplicationController
	before_action :set_poem, only: [:show, :edit, :update, :destroy]

	def index
		@poems = Poem.all
	end

	def new
		@poem = Poem.new
	end

	def create
		@poem = Poem.create(poem_params)
		redirect_to poem_path(@poem)
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

    def set_poem
    	@poem = Poem.find(params[:id])
    end

	def poem_params
		params.require(:poem).permit(:user_id, :title, :line_count, :round_id, :line1_syllables, :line2_syllables, 
			:line3_syllables, :line4_syllables, :line5_syllables, :line6_syllables, :line7_syllables, :line8_syllables,
			:line9_syllables, :line10_syllables, :line1, :line2, :line3, :line4, :line5, :line6, :line7, :line8, :line9,
			:line10, :submitted, :public)
	end

end
