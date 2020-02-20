class ApplicationController < ActionController::Base
  # Ruby Architecture - Can I mix in privately...
  include ApplicationHelper::SessionsHelper
  
  before_action :current_user
  
  # Action / End point to HTTP Request
  def index 
    
  end

  private
    def authentication_required
      if !logged_in?
        redirect_to "/login"
      end
    end


end
