class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new()
  end

  def create
    
  end

  private
  def item_params
    params.require(:item).permit(:title, :item_description, :category_id, :item_state_id, :shipping_cost_id, :shipping_area_id, :shipping_time_id, :cost, :image)
  end
end
