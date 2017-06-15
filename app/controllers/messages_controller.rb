class MessagesController < ApplicationController
before_action :set_group

  def index
    @groups = current_user.groups
  end


 private
  def set_group
    if params[:group_id].present?
     @group = Group.find(params[:group_id])
    end
  end
end
