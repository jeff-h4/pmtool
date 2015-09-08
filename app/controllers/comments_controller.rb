class CommentsController < ApplicationController

  before_action :find_comment, only: [:edit, :update, :destroy]

  def create
    @project    = Project.find params[:project_id]
    @discussion = Discussion.find params[:discussion_id]
    @comment    = Comment.new comment_params
    @comment.discussion = @discussion
    if @comment.save
      redirect_to [@project,@discussion], notice: "Comment entry created." 
    else
      redirect_to [@project,@discussion], alert: "Comment entry was NOT created." 
    end
  end
  def edit
    @project    = Project.find params[:project_id]
    @discussion = Discussion.find params[:discussion_id]
  end
  def update
    @project    = Project.find params[:project_id]
    @discussion = Discussion.find params[:discussion_id]
    if @comment.update comment_params
      redirect_to [@project,@discussion], notice: "Comment entry updated." 
    else
      redirect_to [@project,@discussion], alert: "Comment entry was NOT updated." 
    end
  end
  def destroy
    @project    = Project.find params[:project_id]
    @discussion = Discussion.find params[:discussion_id]
    @comment.delete
    redirect_to [@project,@discussion], notice: "Comment entry deleted."
  end
  private
  def comment_params
    params.require(:comment).permit(:body)
  end 
  def find_comment
    @comment = Comment.find params[:id]
  end
end
