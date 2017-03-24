class TasksController < ApplicationController
	before_action :logged_in_user, only: [:create, :destroy]

	def index
			@tasks = Task.where :user_id => session[:user_id]
	end

	def new
		@task = Task.new
	end

	def create
		@task = current_user.tasks.build(task_params)
		@task.save
		redirect_to tasks_path
	end

	def edit
    @task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	@task.update(task_params)
  	redirect_to tasks_path
  end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		redirect_to tasks_path
	end

	private
	def task_params
		params.require(:task).permit(:title, :note, :completed)
	end
end
