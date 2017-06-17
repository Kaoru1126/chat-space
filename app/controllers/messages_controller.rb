class MessagesController < ApplicationController
before_action :set_group, only: [:index]
before_action :set_message,  only: [:create, :index]

  def index
    @messages = Message.order("id DESC")
  end

  def create
       @message = Message.new(message_params)
    if @message.save
       redirect_to action: :index, notice: 'メッセージが送信されました'
    else
      flash[:alert] = "メッセージを入力して下さい"
      render :index
    end
  end

 private

  def set_group
    @groups = current_user.groups
    # indexにユーザー名を出すためのやつ
    # - @members.each do |member| ←/index.html.haml内に書いてある
    # = member.user.name          ←/index.html.haml内に書いてある

    @group = Group.find(params[:group_id])
    @users = @group.users.order("id DESC")
  end

  def set_message
    @message = Message.new
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
