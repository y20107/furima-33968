class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.includes(:user).order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :item_description, :category_id, :item_state_id, :shipping_cost_id, :shipping_area_id,
                                 :shipping_time_id, :cost, :image).merge(user_id: current_user.id)
  end
end
