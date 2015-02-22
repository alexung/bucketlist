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
    @item = Item.find(params[:id])
      @item.update(item_params)
      redirect_to list_items_path(item_id: @item.id)
  end

  #def complete
  #end

  private

  def item_params
    params.require(:item).permit([:task, :complete])
  end

end
