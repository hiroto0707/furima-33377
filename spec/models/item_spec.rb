require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品登録' do
    context '商品出品登録ができる時' do
      it 'name、description、status_id、category_id、delivery_fee_id、area_id、day_id、priceが存在すれば登録できる' do
      expect(@item).to be_valid
      end
    end  
  
    context '商品出品登録ができない時' do
      it 'imageが空では登録できない'do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
    

    it 'nameがからでは登録できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'status_idが空では登録できない' do
        @item.status_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
    end

    it 'status_idが0の場合出品できない' do
      @item.status_id= 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Status must be other than 0")
  end

    it 'category_idが空では登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank")
    end

    it 'category_idが0の場合出品できない' do
      @item.category_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 0")
  end

    it 'delivery_fee_idが空では登録できない' do
      @item.delivery_fee_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
    end

    it 'delivery_fee_idが0の場合出品できない' do
      @item.delivery_fee_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery fee must be other than 0")
  end

    it 'area_idが空では登録できない' do
        @item.area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
    end

    it 'area_idが0の場合出品できない' do
      @item.area_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Area must be other than 0")
    end

    it 'day_idが空では登録できない' do
        @item.day_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
    end

    it 'day_idが0の場合出品できない' do
      @item.day_id = 0
      @item.valid?
      expect(@item.errors.full_messages).to include("Day must be other than 0")
  end

    it 'priceが空では登録できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceは全角では登録できない' do
      @item.price = "３０００"
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")   
    end

    it '価格は半角英数混合では登録できないこと' do
       @item.price = 'a1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it '価格は半角英語だけでは登録できないこと' do
      @item.price = 'price'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'priceは300~9,999,999の間出なければ登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is out of setting range")   
    end

    it '10,000,000円以上の場合は登録できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is out of setting range")
    end

  end

  end  
end    