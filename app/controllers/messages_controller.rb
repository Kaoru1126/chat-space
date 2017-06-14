class MessagesController < ApplicationController

  def index
    @groups = Group.all
  end

end
