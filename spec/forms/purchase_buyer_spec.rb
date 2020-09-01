require 'rails_helper'

RSpec.describe PurchaseBuyer, type: :model do
  before do
    @purchase = FactoryBot.build(:purchase_buyer)
  end

  describe '購入処理' do
    context '購入がうまくいくとき' do
      it 'user_id, item_id, postal_code, prefecture_id, city, address, phone_numがあれば購入できる' do
        expect(@purchase).to be_valid
      end
    end

    context '購入がうまくいかないとき' do
      it 'postal_codeがハイフンがなければ購入できない' do
        @purchase.postal_code = '1112222'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code is invalid')
      end
      it 'postal_codeが空だと購入できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'prefecture_idが1だと購入できない' do
        @purchase.prefecture_id = '1'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'cityが空だと購入できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと購入できない' do
        @purchase.address = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Address can't be blank")
      end
      it 'phone_numが空だと購入できない' do
        @purchase.phone_num = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone num can't be blank")
      end

      it 'phone_numが半角数字11桁以内以外だと購入できない' do
        @purchase.phone_num = '０９０−１１１１−２２２２'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone num is invalid')
      end
    end
  end
end
