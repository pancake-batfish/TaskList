class TasksController < ApplicationController
  def index

    # @tasks = [
    #   "order pens",
    #   "stop by book launch",
    #   "print outline for talk",
    #   "practice talk"
    # ]
    @tasks = Task.all
  end
end
