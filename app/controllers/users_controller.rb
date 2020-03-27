class UsersController < ApplicationController

  before_action :logged_in?

  # GET /register - New User Action
  def new 
    if logged_in?
      redirect_to user_path(current_user), :notice => "Already logged in!"
    else
      @user = User.new
    end
  end

  # POST /users - Create the User Action
  def create
    @user = User.create(user_params)
    # if @user.valid? 
    if @user.save
      session[:user_id] = @user.id
      # byebug
      flash.notice = "Successfully Signed in!"

      redirect_to user_path(@user)
    else  
      flash.alert = "#{@user.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def create_google
    if auth
         @user = User.find_by(email: auth[:info][:email])
     if @user.valid?
         @user.save
         session[:user_id] = @user.id
         flash.notice = "Signed in sucessfully as #{@user.username}"
         redirect_to profile_path(@user)
     elsif @user.nil?
         @user = User.create!(
             email: auth[:info][:email],
             username: auth[:info][:username],
             password: SecureRandom.urlsafe_base64
         )
         session[:user_id] = user.id
         flash.notice = "Signed in sucessfully as #{@user.username}"
         redirect_to profile_path(@user)
     else
         flash.alert = "#{@user.errors.full_messages.to_sentence}"
         render :new
     end
   end
 end


  def show
    @user = User.find_by(id: session[:user_id])
  end

  private

  def user_params 
      params.require(:user).permit(:username, :email, :password, :password_conformation)
  end

  def auth
      request.env['omniauth.auth']
  end

end