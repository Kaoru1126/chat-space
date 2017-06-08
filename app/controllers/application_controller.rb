class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
<<<<<<< HEAD
=======
  before_action :configure_permitted_parameters, if: :devise_controller?

def configure_permitted_parameters
  devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    end
end
>>>>>>> 85f09d7cc4aaed9b73bad22577f66c35e8018696

end
