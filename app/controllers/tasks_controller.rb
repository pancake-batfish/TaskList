require 'date'

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
    task = Task.create task_params

    unless task.id == nil
      redirect_to tasks_path
    end
  end

  def edit
    @task = Task.find(params[:id])
  end

  def update
    task = Task.find(params[:id])

    if task.update(task_params)
      redirect_to task_path
    end
  end

  def destroy
    Task.destroy(params[:id])
    redirect_to tasks_path
  end

  def complete
    #add current date to date_complete field
    task = Task.find(params[:id])
    task.date_complete = Date.today
    task.save
    redirect_to tasks_path
  end

  private

  def task_params
    params.require(:task).permit(:name, :description, :context)
  end
end
