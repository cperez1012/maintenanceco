class UsersController < ApplicationController

  before_action :logged_in?, except: [:show]

  def index
    # @users = User.all
    @users = User.all_except(current_user)
  end

  def new
    if logged_in?
      redirect_to profile_path(current_user)
    else
      @user = User.new
    end
  end

  def create
    @user = User.new(user_params)
    if @user.valid?
      @user.save
      session[:user_id] = @user.id
      flash[:notice] = "Signed in successfully as #{@user.username}"
      redirect_to profile_path(@user)
    else
      flash[:alert] = "#{@user.errors.full_messages.to_sentence}"
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def profile
    @user = User.find_by(id: session[:id])
  end

  private

  def user_params 
    params.require(:user).permit(:username, :email, :password)
  end

end