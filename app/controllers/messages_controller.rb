class MessagesController < ApplicationController
before_action :set_group, only: [:index, :create]
before_action :to_display_users_groups, only: [:index, :create]
before_action :set_message,  only: [:index, :create]

  def index
    @messages = @group.messages
  end

  def create
    @message = Message.new(message_params)
    if @message.save
       flash[:notice] = '送信されました'
       redirect_to action: :index
    else
      flash[:alert] = "メッセージかイメージを入力して下さい"
      render :index
    end
    @messages = @group.messages
  end

 private

  def to_display_users_groups
    # indexにユーザー名を出すためのやつ
    # - @members.each do |member| ←/index.html.haml内に書いてある
    # = member.user.name          ←/index.html.haml内に書いてある
    @groups = current_user.groups
  end

  def set_group
    @group = Group.find(params[:group_id])
    @users = @group.users.order("id ASC")
  end

  def set_message
    @message = Message.new
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
