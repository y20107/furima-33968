require 'rails_helper'

RSpec.describe Address, type: :model do
  before do
    @address = FactoryBot.build(:address)
  end

  describe '配送先登録' do
    context '配送先登録できる時' do
      it '紐づく購入が存在すれば登録できる' do
        expect(@address).to be_valid
      end
    end
    context '配送先登録できない時' do
      it '紐づく購入がないと登録できない' do
        @address.order = nil
        @address.valid?
        expect(@address.errors.full_messages).to include 'Order must exist'
      end
    end
  end
end
