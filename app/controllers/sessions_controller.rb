class SessionsController < ApplicationController
    helper_method :logged_in?, :current_user

    def new
      if logged_in?
        redirect_to profile_path(current_user)
      else
        @user = User.new
      end
    end

    def create
      @user = User.find_by(:email => params[:session][:email])

      if @user && @user.authenticate(params[:session][:password])

        session[:user_id] = @user.id
        flash[:notice] = "#{@user.username} has successfully logged in!"
        redirect_to profile_path(@user)
      else
        flash[:alert] = "Sorry your email or password was invalid"
        redirect_to login_path
      end
    end

    def destroy
      if logged_in? 
        session.clear 
        flash[:notice] = "Signed out successfully"
        redirect_to login_path
      else
        redirect_to signup_path
      end
    end

    def google_auth

      @user = User.find_or_create_from_omniauth_hash(auth)
  
      session[:user_id] = @user.id
      redirect_to profile_path, notice: 'Successfully connected to Google!'
    end

    def github_auth
      
      @user = User.find_or_create_from_omniauth_hash(auth)
      # binding.pry
      session[:user_id] = @user.id
      redirect_to profile_path, notice: 'Successfully connected to Github!'
    end
  
    private
  
    def auth
      request.env['omniauth.auth']
    end

end
