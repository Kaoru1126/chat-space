class UsersController < ApplicationController
 before_action :move_to_sign_in
 before_action :making_user

  def edit
  end

  def update
    if @user == current_user.id
       user.update(name:user_params[:name], email:user_params[:email])
      end
  end

  private
  def making_user
     @user = User.find(params[:id])
  end

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :email])
  end

  def user_params
      params.require(:user).permit(:name, :email)
  end

  def move_to_sign_in
    redirect_to new_user_session unless user_signed_in?
  end
end
