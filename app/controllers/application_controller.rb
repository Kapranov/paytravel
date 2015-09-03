class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  protected
    def after_sign_in_path_for(resource)
      flights_path
    end

    def after_update_path_for(resource)
      edit_user_registration_path
    end
end
