class MessagesController < ApplicationController
  # before_action :move_to_sign_in unless user_signed_in?

  def move_to_sign_in
      user_session
  end

end

