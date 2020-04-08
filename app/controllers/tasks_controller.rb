class TasksController < ApplicationController

    def index
        if logged_in?
            @tasks = Task.all
        else
            redirect_to login_path
        end
    end

    def new
        if logged_in?
            @task = Task.new
            # binding.pry 
        else
            redirect_to login_path
        end
    end

    def create
        @task = Task.new(task_params)
        if @task.save
        
            redirect_to task_path(@task)
        else
            binding.pry
            redirect_to new_task_path
        end
    end

    def edit
        @task = Task.find_by(params[:id])
    end

    def show
        @task = Task.find(params[:id])
    end

    def update
        @task = Task.find(params[:id])
        @task.update(task_params)
        redirect_to task_path(@task)
    end

    def destroy
        if @task.destroy
            flash[:notice] = "Task was deleted"
            redirect_to tasks_path
        else
          flash[:alert] = "Task not deleted. Please try again"
        end
    end
  
    private

    def task_params
        params.require(:task).permit(:summary, :description, :priority, :created_by, :project, :status, :comment)
    end
end 