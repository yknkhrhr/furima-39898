require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    @user = FactoryBot.create(:user)
    sleep(0.1)
    @item = FactoryBot.create(:item)
    sleep(0.1)
    @order_address = FactoryBot.build(:order_address, user_id: @user.id, item_id: @item.id)
  end

  describe '商品購入の保存' do

    context '保存ができる場合' do
      it 'すべての項目が入力されて商品が購入ができる' do
        expect(@order_address).to be_valid
      end
      it '建物名がなくても商品が購入できる' do
        @order_address.building = ''
        expect(@order_address).to be_valid
      end
    end

    context '保存ができない場合' do
      it 'user_idが空では購入できない' do
        @order_address.user_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では購入できない' do
        @order_address.item_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order_address.token = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @order_address.postal_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeはハイフンがないと保存できない' do
        @order_address.postal_code = '1234567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'postal_codeは3桁-4桁でないと保存できない' do
        @order_address.postal_code = '12-34567'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefecture_idが0では保存できない' do
        @order_address.prefecture_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idが空では保存できない' do
        @order_address.prefecture_id = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存できない' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
      end
      it 'blockが空では保存できない' do
        @order_address.block = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Block can't be blank")
      end
      it 'phone_numberが空では保存できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberが9桁未満では保存できない' do
        @order_address.phone_number = '123456789'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is too short")
      end
      it 'phone_numberは半角数字以外は保存できない' do
        @order_address.phone_number = 'あ'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid. Input only number")
      end
    end
  end
end