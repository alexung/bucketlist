class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    @item.list = List.find(params[:list_id])
    @item.save
      redirect_to list_items_path(item_id: @item.id)
  end

  def update
    #binding.pry
    @item = Item.find(params[:id])
    @list = @item.list
      @item.update(item_params)
      redirect_to list_items_path(list_id: @list.id, item_id: @item.id)
  end

  def complete
    #TODO mark selected tasks complete
    redirect_to root_path
  end

  def destroy
    @item = Item.find(params[:id])
    @item.destroy

      redirect_to list_items_path(list_id: @item.list.id, item_id: @item.id)
  end

  private

  def item_params
    params.require(:item).permit([:task, :complete])
  end

end
