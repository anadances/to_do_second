class TasksController < ApplicationController

  def new
    @task = Task.new(:list_id => params[:list_id])
  end

  def create
    @task = Task.new(task_params)
    if @task.save
      flash[:notice] = 'Your task has been created'
      redirect_to list_path(@task.list)
    else
      render :new
    end
  end

  def edit 
    @task = Task.find(params[:id])
  end

  def update
    @task = Task.find(params[:id])
    if @task.update(task_params)
      flash[:notice] = "Your task was successfully updated"
      redirect_to list_path(@task.list)
    else
      render :edit
    end
  end

  def destroy
    @task = Task.find(params[:id])
    @task.destroy
    flash[:notice] = "Your task was successfully destroyed"
    redirect_to list_path(@task.list)
  end


private

  def task_params
    params.require(:task).permit(:name, :list_id, :done)
  end
end