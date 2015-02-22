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
  end

  private

  def list_params
    params.require(:list).permit([:title])
  end

end
