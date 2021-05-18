class TasksController < ApplicationController

def index
  @tasks = Task.all
end

def show
  @task = Task.find(params[:id])
end

def new
  @task = Task.new
end

def create
  @task = Task.new(task_params)
  if @task.save
    redirect_to task_path(@task)
  else
    render 'new.html.erb'
  end
end

def edit
  @task = Task.find(params[:id])
end

def update
  @task = Task.find(params[:id])
  if @task.update(task_params)
    redirect_to task_path(@task)
  else
    render 'edit.html.erb'
  end
end

private

def task_params
  params.require(:task).permit(:title, :details)
end



end
