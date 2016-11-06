class WelcomeController < ApplicationController
  def index
  	if user_signed_in?  		
  		redirect_to player_path(current_user.id)
  	end
  end
end
