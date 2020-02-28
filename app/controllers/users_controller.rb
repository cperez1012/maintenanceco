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
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      # byebug
      flash.notice = "Successfully Signed in!"

      redirect_to user_path(@user)
    else
      flash.alert = "#{@user.errors.full_messages.to_sentence}"
      render :new
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
