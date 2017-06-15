class GroupsController < ApplicationController
  before_action :set_group, except: [:show, :create, :new, :index]

  def index
    @groups = current_user.groups
  end

  def new
    @group = Group.new
    @group.users << current_user
  end

  def edit
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

  def update
    @group = Group.find(params[:id])
      if @group.update(group_params)
        redirect_to group_messages_path(@group.id), notice: "グループを編集しました。"
      else
        flash[:alert] = "グループの編集に失敗しました"
        render :edit
      end
  end

  private

  def set_group
    @group = Group.find(params[:id])
  end

  def group_params
    params.require(:group).permit(:name, {user_ids: []})
  end

end
