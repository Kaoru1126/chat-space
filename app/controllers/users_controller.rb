class UsersController < ApplicationController
before_action :move_to_index, :except => [:index]

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params [:id])
    if user.user_id == current_user.id
      user.update(user_params)
    end
  end

  private
  def user_params
      params.permit(:name, :email)
  end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end
end

