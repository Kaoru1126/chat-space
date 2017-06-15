class MessagesController < ApplicationController
before_action :set_group

  def index
    @group = Group.find(params[:group_id])
  end


  def create
  end

  def new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

 private

  def set_group
    @groups = current_user.groups

    # indexにユーザー名を出すためのやつ
    # - @members.each do |member| ←/index.html.haml内に書いてある
    # = member.user.name          ←/index.html.haml内に書いてある
    @group = Group.find(params[:group_id])
    @members = @group.members
  end
end
