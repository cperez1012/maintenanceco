class ApplicationController < ActionController::Base
   

    helper_method :current_user, :logged_in?, :set_rental_properties

    private

    def current_user
        @current_user ||= User.find_by(id: session[:user_id])
    end

    def logged_in?
        !!current_user
    end
    
end