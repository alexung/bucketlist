class ListsController < ApplicationController

  def index
    @lists = List.all
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:success]
      redirect_to '/'
    else
      flash[:error]
      redirect_to '/lists/new'
    end
  end

  def show
    @list = List.find(params[:id])
    @incomplete_items = @list.items.where(complete: false)
    @complete_items = @list.items.where(complete: true)
  end

  def update
    @list = List.find(params[:id])
    if @list.update_attributes!(params[:list])
      flash[:notice] = "Successfully updated list"
      redirect_to root_path
    else
      render :action => 'edit'
    end
  end

  private

  def list_params
    params.require(:list).permit([:title])
  end

end
