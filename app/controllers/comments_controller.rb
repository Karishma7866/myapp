class CommentsController < ApplicationController
    def create
    comment = Comment.new(comment_params)
        if comment.save
        render json: comment
        else
        render json: {error: 'comment not inserted'}
        end
    end
    def index
        case params[:type]
        when "post"
            comments = Comment.where(commentable_type: "post")
        when "event"
            comments = Comment.where(commentable_type: "event")
        when "forum"
            comments = Comment.where(commentable_type: "forum")
        else
            comments = Comment.all
        end
        render json: comments
            
    end
    private
    def comment_params
        params.require(:comment).permit(:content, :commentable_id, :commentable_type)
    end

end
