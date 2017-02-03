class TasksController < ApplicationController

	def index
			@tasks = Task.where :created_by => session[:user_id]
			binding.pry
	end

	def show
	end

	def new
		@task = Task.new
	end

	def create
		@task = Task.create(task_params)
		redirect_to root_path
	end

	def edit
    @task = Task.find(params[:id])
  end

  def update
  	@task = Task.find(params[:id])
  	@task.update(task_params)
  	redirect_to root_path
  end

	def destroy
		@task = Task.find(params[:id])
		@task.destroy

		redirect_to root_path
	end

	private
	def task_params
		params.require(:task).permit(:title, :note, :completed, :created_by)
	end
end
