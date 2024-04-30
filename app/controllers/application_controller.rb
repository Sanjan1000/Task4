class ApplicationController < ActionController::Base
  helper_method :current_user

  def current_user
    @current_user ||= session[:user_id] && User.find_by(id: session[:user_id])
  end
  def before_action_with_login_tracking
    if current_user
      current_user.update(last_login_at: Time.now)
      current_user.save!
    end
  end
  
end