require 'rails_helper'

RSpec.describe Order, type: :model do
  before do
    @order = FactoryBot.build(:order)
  end
  
  describe '商品購入登録' do 
    context '商品購入登録ができない時' do
      it "tokenが空では登録できないこと" do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では購入できないこと" do
        @order.user_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Status can't be blank")
      end

      it "item_idが空では購入できないこと" do
        @order.item_id = ''
        @order.valid?
        expect(@order.errors.full_messages).to include("Status can't be blank")
      end
    end
  end
end