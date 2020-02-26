class SessionsController < ApplicationController
    helper_method :logged_in?
    def home 
        render 'sessions/new'
    end
    
    def new 
        if logged_in?
            redirect_to user_path(current_user)
        end
    end

    # accept the params from the form
    def create
        # find the user by email
        @user = User.find_by(email: params[:session][:email])
        if @user && @user.authenticate(params[:session][:password])
            #actually logs the user in
            session[:user_id] = @user.id
            # then render user profile 
            flash.notice = "Signed in sucessfully as #{@user.name}"
            redirect_to user_path(@user)
        else # if not authenticated
            flash.alert = "Invalid Email or Password.  Please try again."
            #redirect back to login form
            render :new 
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to new_session_path
    end
end
