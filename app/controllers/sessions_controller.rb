class SessionsController < ApplicationController
    helper_method :logged_in?, :current_user
    # def home 
    
    # end
    
    def new 
        if logged_in?
          redirect_to profile_path(current_user)
        else
          redirect_to login_path
        end
    end

    def create
      @user = User.find_by(email: params[:session][:email])
    
      if @user && @user.authenticate(params[:session][:password])
        session[:user_id] = @user.id
        redirect_to profile_path(@user)
      else
        flash[:alert] = "Invalid email and/or password."
        redirect_to login_path
      end
    end

    def destroy
        if logged_in?
          session.destroy
          flash[:notice] = "You have successfully logged out!"
          redirect_to login_path
        else
          flash[:alert] = "You can't log out unless you're logged in!"
          redirect_to login_path
        end
    end

    def google_login
        @user = User.from_google_omniauth(auth_info)
        # binding.pry
        @user.save
        login_user(user)
    end

    private

    def auth_info
        request.env['omniauth.auth']['info']
    end

    def login_user(user)
        session[:user_id] = user.id
        flash[:notice] = "You are logged in!"
        redirect_to profile_path
    end
end
