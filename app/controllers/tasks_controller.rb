class TasksController < ApplicationController

    before_action :current_user, :logged_in?
    before_action :set_task, only: [:show, :edit, :update, :destroy]

    def index
        if logged_in?
            @tasks = current_user.tasks
        else
            redirect_to login_path
        end
    end

    def new
        if logged_in?
            @task = Task.new 
        else
            redirect_to login_path
        end
    end

    def create
        # binding.pry
        @task = current_user.tasks.build(task_params)
        # raise @task.inspect
        @task.save
        # if @task.save
        # binding.pry 
        redirect_to task_path(@task)
        # else
        #     # binding.pry
        #     redirect_to new_task_path
        # end
    end

    def edit        
        @task = Task.find(params[:id])
    end

    def show
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find_by(task_params)
        @task.update(task_params)
        redirect_to task_path(@task)
    end

    def destroy
        
        @task = Task.find_by(id: params[:id])
        if @task.destroy || @task.lists.destroy
            flash[:notice] = "Task was deleted"
        else
          flash[:alert] = "Task not deleted. Please try again"
        end
        redirect_to tasks_path
    end
  
    private

    def set_task
        @task = Task.find_by(id: params[:id])
    end

    def task_params
        params.require(:task).permit(:name, :summary, :description, :priority, :created_by, :project, :status)
    end
end 