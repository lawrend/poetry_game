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
		if @poem.update(poem_params)
			redirect_to poem_path(@poem)
		end
	end

	def destroy
	end

	private

    def set_poem
    	@poem = Poem.find(params[:id])
    end

	def poem_params
		params.require(:poem).permit(:user_id, :title, :round_id, :status, :public, :line1_syllable_count, :line2_syllable_count, 
			:line3_syllable_count, :line4_syllable_count, :line5_syllable_count, :line6_syllable_count, :line7_syllable_count, 
			:line8_syllable_count, :line9_syllable_count, :line10_syllable_count, :line1, :line2, :line3, :line4, :line5, :line6, 
			:line7, :line8, :line9, :line10)
	end

end
