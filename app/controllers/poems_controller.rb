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
		params.require(:poem).permit(:user_id, :title, :line_count, :round_id, :submitted, :public)
	end

end
