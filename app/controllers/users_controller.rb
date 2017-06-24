class UsersController < ApplicationController
 before_action :move_to_sign_in
 before_action :set_user

  def index
    @users = User.where('name LIKE(?)', "#{params[:keyword]}%").order('name ASC')
      respond_to do |format|
        format.json { render 'index', json: @users }
      end
  end

  def edit
  end

  def update
    if @user == current_user
       @user.update(user_params)
       redirect_to root_path
      else
       render :edit
      end
  end

  private
  def set_user
    if params[:id] != nil
     @user = User.find(params[:id])
    end
  end

  def user_params
      params.require(:user).permit(:name, :email)
  end

  def move_to_sign_in
      user_session
  end
end
