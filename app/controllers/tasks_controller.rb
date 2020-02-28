class TasksController < ApplicationController
    def index
        @tasks = Task.all
    end

    def new
        @task = Task.new
    end

    def create
        @task = Task.new(params[:task])
        task.save
        redirect_to @task.list
    end

    def show

    end

    def update
        @task = Task.find(params[:id])
        @task.update_attributes(params[:task])
        redirect_to @task.list
    end

    def destroy
        @task = Task.find(params[:id])
        @task.destroy
        redirect_to @task.list
    end
end 