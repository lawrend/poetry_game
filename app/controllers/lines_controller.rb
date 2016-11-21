class LinesController < ApplicationController
  before_action :set_line, only: [:show, :edit, :update, :destroy]

  def new
    @line = Line.new 
  end

  def create
    @line = Line.create(line_params)
    redirect_to poem_path(@line.poem_id)
  end

  def edit
  end

  def update
  	@line.update(line_params)
  	redirect_to poem_path(@line.poem_id)
  end



  private

  def set_line
  	@line = Line.find(params[:id])
  end

  def line_params
  	params.require(:line).permit(:poem_id, :line_number, :syllable_count, :line_content)
  end
end
