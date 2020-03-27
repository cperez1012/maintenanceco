class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
    def google_oauth2
      # binding.pry
      @user = User.from_omniauth(request.env["omniauth.auth"])
      if @user.persisted?
        sign_in @user, :event => :authentication #this will throw if @user is not activated
        set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
      else
        session["devise.google_data"] = request.env["omniauth.auth"]
        redirect_to login_path
      end
    end

    def failure
      redirect_to login_path
    end

    def after_omniauth_failure_path_for(scope)
      login_path(scope)
    end
  end

  # class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  #   def google_oauth2
  #     @user = User.from_omniauth(request.env["omniauth.auth"])
  # if @user.persisted?
  #       sign_in @user, :event => :authentication #this will throw if @user is not activated
  #       set_flash_message(:notice, :success, :kind => "Google") if is_navigational_format?
  #     else
  #       session["devise.google_data"] = request.env["omniauth.auth"]
  #     end
  #     redirect_to '/'
  #   end
  # end