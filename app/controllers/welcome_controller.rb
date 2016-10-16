class WelcomeController < ApplicationController
  def index
  	if user_signed_in?
  		@player = current_user
  		render :player_home
  	end
  end
end
