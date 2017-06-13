class MessagesController < ApplicationController
  before_action :authenticate_user!

  def index
    @groups = Group.all
  end

end
