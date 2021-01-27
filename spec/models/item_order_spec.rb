require 'rails_helper'

RSpec.describe ItemOrder, type: :model do
  before do
    @order = FactoryBot.build(:item_order)
  end

  describe '商品購入' do
    context '商品購入できる時' do
      it '全てのカラムが存在すれば購入できる' do
        expect(@order).to be_valid
      end
      it '建物名が空でそれ以外のカラムが存在すれば購入できる' do
        @order.building_name = ''
        expect(@order).to be_valid
      end
    end
    context '商品購入できない時' do
      it 'クレジットカード情報(トークン)が空では購入できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include "Token can't be blank"
      end
      it '郵便番号が空では購入できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Postal code can't be blank"
      end
      it '都道府県が空では購入できない' do
        @order.prefecture_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Prefecture can't be blank"
      end
      it '市区町村が空では購入できない' do
        @order.city = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "City can't be blank"
      end
      it '番地が空では購入できない' do
        @order.banchi = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Banchi can't be blank"
      end
      it '電話番号が空では購入できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include "Phone number can't be blank"
      end
      it '郵便番号はハイフンが含まれていないと購入できない' do
        @order.postal_code = '1110000'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Postal code Input correctly'
      end
      it '郵便番号に全角が含まれていると購入できない' do
        @order.postal_code = '１１１ー００００'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Postal code Input correctly'
      end
      it '電話番号が12桁以上では購入できない' do
        @order.phone_number = '090123456789'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number is out of setting range'
      end
      it '電話番号に全角が含まれていると購入できない' do
        @order.phone_number = '０９０１２３４５６７８'
        @order.valid?
        expect(@order.errors.full_messages).to include 'Phone number Input only number'
      end
    end
  end
end
