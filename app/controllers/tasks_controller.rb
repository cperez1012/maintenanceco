class TasksController < ApplicationController

    before_action :set_task, only: %i[show edit update destroy]
    before_action :authenticate_user!

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
            redirect_to new_task_path
        else
            flash[:alert] = "You must be logged in to do that"
            redirect_to login_path
        end
    end

    def edit
        @task = Task.find(params[:id])
    end

    def create
        @task = Task.new(params[:task])
        @task.save
        redirect_to task_path(@task)
    end

    def show
        @task = Task.find(params[:id])
        @comments = @task.comments.order('created_at DESC').page params[:page]
    end

    def update
        if @task.update(task_params)
          redirect_to task_path, notice: 'Task was successfully updated.'
        end
    end
  

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to @task.list
    end

    private

    def set_task
        @task = Task.find(params[:id])
    end

    def task_params
        params.require(:task).permit(:summary, :description, :priority, :created_by, :tst, :dev, :tst_est, :dev_est, :project, :status, :comment)
    end
end 