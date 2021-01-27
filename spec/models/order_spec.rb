require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it '紐付くユーザー、商品が存在すれば購入できる' do
        expect(@order).to be_valid
      end
    end
    context '商品購入できない時' do
      it '紐付くユーザーが存在しないと購入できない' do
        @order.user = nil
        @order.valid?
        expect(@order.errors.full_messages).to include 'User must exist'
      end
      it '紐付く商品が存在しないと購入できない' do
        @order.item = nil
        @order.valid?
        expect(@order.errors.full_messages).to include 'Item must exist'
      end
    end
  end
end
