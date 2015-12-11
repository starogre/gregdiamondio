class ProjectsController < ApplicationController
  before_action :require_login
  skip_before_action :require_login, only: [:index]

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
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to projects_path
  end

  private
  def project_params
    params.require(:project).permit(
      :title,
      :description,
      :github_address,
      :screenshot
    )
  end

  def require_login
    redirect_to '/login' unless user_signed_in?
  end
end
