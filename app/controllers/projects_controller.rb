class ProjectsController < ApplicationController

  def index
    @project = Project.new
    @projects = Project.all
  end

  def edit
    @project = Project.find(params[:id])
  end

  def create
    @project = Project.new(project_params)
    @project.save
    @projects = Project.all

    render 'index'
  end

  def update
  end

  def destroy
    @project.destroy
  end

  private
  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :screenshot
    )
  end
end
