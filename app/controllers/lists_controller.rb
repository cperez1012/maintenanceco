class ListsController < ApplicationController

    # before_action :set_list

    def index
        @lists = List.all
        @list = @tasks
    end

    # private

    # def set_list
    #     @list = @task.lists.find(params[:task_id])
    # end

end 