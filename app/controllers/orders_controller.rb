class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item

  def index
    @item_order = ItemOrder.new
  end

  def create
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
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :banchi, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: params[:item_id], token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.cost,
      card: order_params[:token],
      currency: 'jpy'
    )
  end

  def find_item
    @item = Item.find(params[:item_id])
    return redirect_to root_path if current_user == @item.user
    return redirect_to root_path unless @item.order.nil?
  end
end
