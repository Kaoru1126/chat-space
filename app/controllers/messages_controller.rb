class MessagesController < ApplicationController
before_action :set_group

  def index
    @group = Group.find(params[:group_id])
  end


 private
 
  def set_group
    @groups = current_user.groups
    @group = Group.find(params[:group_id])
    @members = @group.members
  end
end
