class UserSessionsController < ApplicationController
  def new
    @user = User.new
  end
  def index
    binding.break
  end

  def create
    @user = User.find_by(name: params[:user][:name])

    if @user && @user.authenticate(params[:user][:password]) && @user.is_blocked =="active"
      session[:user_id] = @user.id
      before_action_with_login_tracking
      redirect_to root_path
    else
      flash[:alert] = "Login failed or User has been blocked"
      redirect_to new_user_session_path
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end
