class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new
  end

  def create
    @item = Item.find(params[:item_id])
    @item_order = ItemOrder.new(order_params)
    if @item_order.valid?
      pay_item
      @item_order.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :banchi, :building_name, :phone_number).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.cost,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
