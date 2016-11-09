class CommentsController < ApplicationController
before_action :find_commentable

  def new
    @comment = Comment.new
  end

  def edit
  end

  def create
    @comment = @commentable.comments.new comment_params
    @comment.user = current_user

    if @comment.save
      redirect_to :back, notice: 'Your comment was successfully posted!'
    else
      redirect_to :back, notice: "Your comment wasn't posted!"
    end
  end

  def update
  end

  def destroy
    Post.find(params[:id]).destroy
    redirect_to :back, notice: 'Comment removed!'
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end

  def find_commentable
    @commentable = Event.find_by_id(params[:event_id]) if params[:event_id]
    @commentable = Location.find_by_id(params[:location_id]) if params[:location_id]
  end
end
