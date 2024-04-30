class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      flash[:notice] = "User created successfully"
      @user.update(is_blocked: "active")
      redirect_to root_path
    else
      flash[:alert] = "User not created"
      render :new, status: :unprocessable_entity
    end
  end
  
  def usage
    selected_user_ids =params[:user_ids]

    if params[:block] 
      User.where(id: selected_user_ids).update_all(is_blocked: "blocked")
    elsif params[:delete] 
      User.where(id: selected_user_ids).destroy_all
    elsif params[:unblock]
      User.where(id: selected_user_ids).update_all(is_blocked: "active")
    end
    redirect_to users_path
  end
  private

  def user_params
    params.require(:user).permit(:name, :email,:password, :password_confirmation)
  end
end
