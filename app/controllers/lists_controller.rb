class ListsController < ApplicationController

    def index
        if logged_in?
            @lists = current_user.lists.ordered_by_name
        else
            redirect_to login_path
        end
    end

    def show
    
       if params[:user_id].present?
        @user = User.find(params[:user_id])
        @list = @user.lists.find(params[:id])
       else
        @list = current_user.lists.find(params[:id])
       end
       
    end
    
    def new 
        if logged_in?
            @list = current_user.lists.build
        else
            redirect_to login_path
        end
    end
    
    def create
        @list = current_user.lists.build(list_params)
        if @list.save
            redirect_to lists_path(@list)
        else
          render :new
        end
    end

    def edit
        @list = current_user.lists.find(params[:id])
    end

    def update
        @list = List.find(params[:id])
        @list.update(list_params)
        redirect_to lists_path(@list)
    end

    def destroy
        @list = List.find(params[:id])
        @list.destroy
        redirect_to lists_path
    end
    
    private
    
    def list_params
        params.require(:list).permit(:name, tasks_attributes: [:name, :summary, :description, :priority, :created_by, :project, :status])
    end

end