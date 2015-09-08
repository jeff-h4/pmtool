class ProjectsController < ApplicationController

  before_action :find_project, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:show,:index]

  def new
    @project = Project.new
  end

  def create 
    @project = Project.new project_params
    if @project.save
      redirect_to project_path(@project), notice: "Project created successfully!"
    else
      flash[:alert] = "Project not created. See errors below:"
      render :new
    end
  end

  def index 
    @projects = Project.all
  end

  def show 
    @discussion = Discussion.new
  end

  def edit 
  end

  def update
    if @project.update project_params 
      redirect_to project_path(@project), notice: "Project updated successfully!"
    else
      flash[:alert] = "Project update failed! See errors below:"
      render :edit
    end
  end
  def destroy
    @project.destroy
    redirect_to projects_path
  end
  private
  def project_params
    params.require(:project).permit(:title,:description,:due_date)
  end
  def find_project
    @project = Project.find params[:id]
  end
end
