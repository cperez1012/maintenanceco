class CommentsController < ApplicationController

    def create
       @list = List.find(params[:list_id])
       comment = Comment.new(comment_params)
       comment.list = @list
       comment.user = current_user
       comment.save
        redirect_to user_list_path(@list.user, @list)
        
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end 