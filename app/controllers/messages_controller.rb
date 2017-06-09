class MessagesController < ApplicationController
  # before_action :move_to_sign_in unless user_signed_in?

  def move_to_sign_in
    redirect_to new_user_session
  end

end

