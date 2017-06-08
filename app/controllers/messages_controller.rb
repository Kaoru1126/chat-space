class MessagesController < ApplicationController

  def edit
    @user = User.find(params[:id])
  end

  def update
    user = User.find(params [:id])
    if user.id == current_user.id
       user.update(name:user_params[:name], email:user_params[:email])
       move_to_index
    else
       redirect_to actin: :edit
    end
  end

  private
  def user_params
      params.require(:user).permit(:name, :email)
  end

  def move_to_index
      redirect_to action: :index unless user_signed_in?
  end

  def index
  end

end


