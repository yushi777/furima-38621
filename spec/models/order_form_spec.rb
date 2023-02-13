require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報が保存されるとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order_form).to be_valid
      end
      it 'user_idが空でなければ保存できる' do
        @order_form.user_id = 1
        expect(@order_form).to be_valid
      end
      it 'item_idが空でなければ保存できる' do
        @order_form.item_id = 1
        expect(@order_form).to be_valid
      end
      it 'postal_codeが3桁＋ハイフン＋4桁」の組み合わせであれば保存できる' do
        @order_form.postal_code = '123-4567'
        expect(@order_form).to be_valid
      end
      it 'prefecture_idが「---」以外であれば登録できる' do
        @order_form.prefecture_id = 2
        expect(@order_form).to be_valid
      end
      it 'municipalitiesが空でなければ保存できる' do
        @order_form.municipalities = '横浜市'
        expect(@order_form).to be_valid
      end
      it 'addressが空でなければ保存できる' do
        @order_form.address = '北区1-2-3'
        expect(@order_form).to be_valid
      end
      it 'buildeing_nameは空でも保存できる' do
        @order_form.building_name = nil
        expect(@order_form).to be_valid
      end
      it 'phone_numberが11番桁以内かつハイフンなしであれば保存できる' do
        @order_form.phone_number = 12_345_678_910
        expect(@order_form).to be_valid
      end
    end
    context '配送先情報が保存されないとき' do
      it 'user_idが空では保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では保存できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it 'postal_codeが空では保存できない' do
        @order_form.postal_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
      end
      it 'postal_codeに-がないと保存できない' do
        @order_form.postal_code = 1_234_567
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが「---」だと保存できない' do
        @order_form.prefecture_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'municipalitiesが空では保存できない' do
        @order_form.municipalities = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end
      it 'pnone_numberが空では保存できない' do
        @order_form.phone_number = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberに-があると保存できない' do
        @order_form.phone_number = 183 - 1312 - 1123
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上あると保存できない' do
        @order_form.phone_number = 1_832_342_342_334
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include('Phone number is invalid')
      end
      it 'tokenが空だと保存できない' do
        @order_form.token = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
