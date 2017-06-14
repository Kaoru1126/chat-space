class GroupsController < ApplicationController

  def new
    @group = Group.new
    current_user = @group
  end

  def create
    @group = Group.new(group_params)
    if @group.save
       redirect_to :root, notice: 'グループを作成しました'
    else
     flash[:alert] = "グループの作成に失敗しました"
     render :new
    end
  end

  def edit
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids: [])
  end

  def move_to_sign_in
    user_session
  end
end
