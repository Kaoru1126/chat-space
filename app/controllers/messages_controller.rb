class MessagesController < ApplicationController
before_action :set_group
before_action :set_message

  def index
    @messages = Message.order("id DESC")
  end

  def create
    if @message = Message.create(message_params)
       redirect_to action: :index
    else
      flash[:alert] = "メッセージを入力して下さい"
      render :index
    end
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
    @users = @group.users.order("id DESC")
  end

  def set_message
    @message = Message.new
  end

  def message_params
    params.require(:message).permit(:body, :image).merge(user_id: current_user.id, group_id: params[:group_id])
  end
end
