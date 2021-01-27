class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]

  def index
    find_item
    @item_order = ItemOrder.new
  end

  def create
    find_item
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

  def find_item
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
    redirect_to root_path unless @item.order.nil?
  end
end
