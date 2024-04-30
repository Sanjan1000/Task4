class PagesController < ApplicationController
  
  def index
  end

  def secret
    if current_user.blank?
      redirect_to new_user_path
    else
      redirect_to users_path
    end
  end
end