class ProjectsController < ApplicationController
  before_action :authenticate_user!
  load_and_authorize_resource param_method: :project_params

  # GET /projects
  def index
    @projects = Project.owned(current_user)
  end

  # GET /projects/1
  def show
    @users = @project.users
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.owner = current_user
    @project.assign_user(current_user)
    if @project.save
      current_user.add_role :owner, @project
      redirect_to projects_url, notice: 'Project was successfully created.'
    else
      render 'new'
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to projects_url, notice: "Project \"#{@project.name}\" was successfully updated."
    else
      render 'edit'
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url
  end

  def assign
    user = User.find(params[:user]['user_id'])
    @project.assign_user(user)
    redirect_to @project
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def project_params
      params[:project].permit(:name, :description)
    end

end
