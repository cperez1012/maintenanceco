class SessionsController < ApplicationController
    helper_method :logged_in?, :current_user

    def new
      @user = User.new 
    end

    def create
      @user = User.find_by(:email => params[:session][:email])
      # binding.pry
      if @user && @user.authenticate(params[:session][:password])
        # binding.pry
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
      # Get access tokens from the google server
      access_token = request.env["omniauth.auth"]
      @user = User.find_or_create_by(current_user)
  
      @user.update_attributes(:google_token => access_token.credentials.token)
  
      # Access_token is used to authenticate request made from the rails application to the google server
      # Refresh_token to request new access_token
      # Note: Refresh_token is only sent once during the first request
  
      refresh_token = access_token.credentials.refresh_token
  
      @user.update_attributes(google_refresh_token: :refresh_token) if refresh_token.present?
  
      session[:user_id] = @user.id.to_s
      redirect_to profile_path(@user), notice: 'Successfully connected to Google!'
    end
  
    #private
  
    def auth
      request.env['omniauth.auth']
    end

end
