class DiscussionsController < ApplicationController

  before_action :discussion_params, only: [:create, :update]
  before_action :find_discussion, only: [:edit, :update, :destroy]

  def create
    @project = Project.find params[:project_id]
    @discussion = Discussion.new discussion_params
    @discussion.project = @project
    if @discussion.save
      redirect_to @project, notice: "Discussion entry created." 
    else
      flash[:alert] = "Error creating discussion"
      redirect_to @project, alert: "Discussion entry was NOT created." 
    end
  end
  def edit
    @project = Project.find params[:project_id]
  end
  def update
    @project = Project.find params[:project_id]
    if @discussion.update discussion_params
      redirect_to @project, notice: "Discussion entry updated." 
    else
      flash[:alert] = "Error editing discussion"
      render :edit
    end
  end
  def destroy
    @project    = Project.find params[:project_id]
    @discussion.destroy
    redirect_to @project, notice: "Discussion Deleted"
  end

  private

  def find_discussion
    @discussion = Discussion.find params[:id]
  end
  def discussion_params
    params.require(:discussion).permit(:title,:body)
  end
end
