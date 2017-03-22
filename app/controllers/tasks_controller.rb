class TasksController < ApplicationController
  def index
    @tasks = Task.all
  end

  def show
    @result_task = Task.find(params[:id])
  end

  def new
    @task = Task.new
  end

  def create
    task = Task.new
    task.name = params[:name]
    task.description = params[:description]
    task.context = params[:context]
    if task.save
      redirect_to tasks_path
    end
  end
end
