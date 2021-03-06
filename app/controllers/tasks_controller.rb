class TasksController < ApplicationController
  before_action :authenticate_user!
  before_action :load_project
  load_and_authorize_resource param_method: :task_params

  def index
    @tasks = Task.where(project_id: params[:project_id])
  end

  def new
    @task = Task.new
  end

  def create
    @task = Task.new(task_params)
    @task.project = @project
    if @task.save
      redirect_to project_tasks_url, notice: 'Task was successfully created.'
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def update
    if @task.update(task_params)
      redirect_to project_tasks_url, notice: "Task \"#{@task.name}\" was successfully updated."
    else
      render 'edit'
    end
  end

  def destroy
    @task.destroy
    redirect_to project_tasks_url
  end

  private
    def task_params
      params[:task].permit(:name, :description, :due_date, :user_id)
    end

    def load_project
      @project = Project.find(params[:project_id])
    end
end
