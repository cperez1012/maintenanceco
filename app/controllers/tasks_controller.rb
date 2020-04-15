class TasksController < ApplicationController

    before_action :current_user, :logged_in?
    # before_action :set_task

    def index
        @list = List.find(params[:list_id])
        @tasks = @list.tasks
    end

    def new
        @list = List.find(params[:list_id])
        @task = @list.tasks.build
    end

    def create
        @list = List.find(params[:list_id])
        @task = @list.tasks.build(task_params)
        if @task.save
          redirect_to list_path(@list)
        else
          flash[:notice] = "Error"
          render 'new'
        end
    end

    def edit        
        @list = List.find(params[:list_id])
        puts @list.id
        @task = Task.find(params[:id])
    end

    # def show
    #     @task = Task.find(params[:id])
    # end

    def update
        @list = List.find(params[:list_id])
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to list_path(@list)
    end

    # def destroy
        
    #     @task = Task.find_by(id: params[:id])
    #     if @task.destroy || @task.lists.destroy
    #         flash[:notice] = "Task was deleted"
    #     else
    #       flash[:alert] = "Task not deleted. Please try again"
    #     end
    #     redirect_to list_path(@task.list)
    # end

    def destroy
        @list = List.find(params[:list_id])
        @task = @list.tasks.find_by(params[:id])
        @task.destroy
        redirect_to list_path(@list)
    end
  
    private

    # def set_list
    #     @list = List.find(params[:list_id])
    # end

    # def set_task
    #     @task = @list.tasks.find(params[:id])
    # end

    def task_params
        params.require(:task).permit(:name, :summary, :description, :priority, :created_by, :project, :status)
    end
end 