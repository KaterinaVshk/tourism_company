class CommentsController < ApplicationController

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.new(comment_params)
    flash[:alert] = 'Комментарий не может быть пустым' unless @comment.save
    redirect_to(tour_path(@comment.tour_id))
  end

  private

  def comment_params
    parameters = params.require(:comment).permit(:content, :tour_id)
    parameters[:user_id] = current_user.id
    parameters
  end
end
