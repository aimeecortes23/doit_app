class SubtasksController < ApplicationController

  def index
    @subtasks = Subtask.all
  end

  def create
    @task = Task.find(params[:task_id])
    @subtask = @task.subtasks.create(subtask_params)
    redirect_to task_path(@task)
  end

  private
    def subtask_params
      params.require(:subtask).permit(:title, :priority)
    end
end
