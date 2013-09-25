class ListsController < ApplicationController
  def index
    @lists = List.all
  end


  def show
    @list = List.find(params[:id])
  end

  def new 
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = "Your list was successfully created."
      redirect_to lists_path
    else
      render :new
    end
  end

  def edit
    @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      flash[:notice] = "Your list has been updated"
      redirect_to list_path
    else
      render :edit
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    flash[:notice] = "Your list was successfully destroyed."
    redirect_to lists_path
  end

private
  def list_params
    params.require(:list).permit(:name)
  end
end