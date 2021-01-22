require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品できる時' do
      it '全てのカラムが存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない時' do
      it '商品画像が空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
      end
      it '商品名が空では登録できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Title can't be blank"
      end
      it '商品の説明が空では登録できない' do
        @item.item_description = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item description can't be blank"
      end
      it 'カテゴリーについて情報が空では登録できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Category can't be blank"
      end
      it '商品の状態について情報が空では登録できない' do
        @item.item_state_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Item state can't be blank"
      end
      it '配送料の負担について情報が空では登録できない' do
        @item.shipping_cost_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
      end
      it '発送元の地域について情報が空では登録できない' do
        @item.shipping_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping area can't be blank"
      end
      it '発送までの日数について情報が空では登録できない' do
        @item.shipping_time_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Shipping time can't be blank"
      end
      it '販売価格が空では登録できない' do
        @item.cost = ''
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost can't be blank"
      end
      it '販売価格が¥300未満では登録できない' do
        @item.cost = 299
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost Out of setting range"
      end
      it '販売価格が¥9,999,999より上では登録できない' do
        @item.cost = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost Out of setting range"
      end
      it '販売価格が全角数字では登録できない' do
        @item.cost = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include "Cost Half-width number"
      end
      it 'ユーザーが紐付いていなければ登録できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
      end
    end
  end
end
