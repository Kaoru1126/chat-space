class MessagesController < ApplicationController
before_action :set_usernames, only: [:index, :create]
before_action :set_groups, only: [:index, :create]

  def index
    @message = Message.new
    @messages = @group.messages
      respond_to do |format|
        format.html
        format.json
      end
  end

  def create
    @message = Message.new(message_params)
    if @message.save
       @messages = @group.messages
      respond_to do |format|
        format.html { render :index, notice: "メッセージを送信しました"}
        format.json
      end
       flash[:notice] = '送信されました'
    else
      flash[:alert] = "メッセージかイメージを入力して下さい"
      @messages = @group.messages
      render :index
    end
  end

 private

  def set_groups
    # indexにユーザー名を出すためのやつ
    # - @members.each do |member| ←/index.html.haml内に書いてある
    # = member.user.name          ←/index.html.haml内に書いてある
    @groups = current_user.groups
  end

  def set_usernames
    @group = Group.find(params[:group_id])
    @users = @group.users.order("id ASC")
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
