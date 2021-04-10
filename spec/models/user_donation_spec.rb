require 'rails_helper'

RSpec.describe UserDonation, type: :model do
  before do
    @order = FactoryBot.build(:user_donation)
  end
  
  describe '商品購入登録' do
    context '商品購入登録ができる時' do
      it 'area_id,municipalities,address,postal_code,phone_numberが存在すれば登録できる' do
      expect(@order).to be_valid
      end

      it 'building_numberが空でも登録できる' do
        expect(@order).to be_valid
      end
    end  

    context '商品購入登録ができない時' do
      it 'area_idが空では登録できない' do
        @order.area_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Area is not a number")
      end

      it 'area_idが0の場合出品できない' do
        @order.area_id = 0
        @order.valid?
        expect(@order.errors.full_messages).to include("Area must be other than 0")
      end

      it 'municipalitiesが空では登録できない' do
        @order.municipalities = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Municipalities can't be blank")
      end

      it 'addressが空では登録できない' do
        @order.address = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end

      it 'postal_codeが空では登録できない' do
        @order.postal_code = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'postal_codeは全角では登録できない' do
        @order.postal_code = "３０００"
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")   
      end

      it 'postal_codeは半角英数混合では登録できない' do
        @order.postal_code = 'a1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal code is invalid")
      end

      it 'phone_numberが空では登録できない' do
        @order.phone_number = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'phone_numberは全角では登録できない' do
        @order.phone_number = "３０００"
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")   
      end

      it 'phone_numberは半角英数混合では登録できない' do
        @order.phone_number = 'a1'
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
      end

      it 'phone_numberは12桁以上では登録できない' do
        @order.phone_number = 123456789123
        @order.valid?
        expect(@order.errors.full_messages).to include("Phone number is invalid")
    end
    end
  end
end
