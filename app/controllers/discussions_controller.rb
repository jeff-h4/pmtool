class DiscussionsController < ApplicationController

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
  def destroy
  end
  private
  def discussion_params
    params.require(:discussion).permit(:title,:body)
  end
end
