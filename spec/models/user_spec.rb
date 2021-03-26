require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'nickname、first_name、last_name、first_name_kana、last_name_kana、email、password、password_confirmation、birthdayが存在すれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end  

    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end  

    it '重複したemailが存在する場合登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
     
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'passwordが存在してもpassword_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end 

    it 'passwordが5文字以下では登録できない' do
      @user.password = '00000'
      @user.password_confirmation = '00000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end

    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end

    it 'first_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end

    it 'last_nameは全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
    it 'first_name_kanaのフリガナは、全角（カタカナ）でなければ登録できない' do
      @user.first_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end

    it 'last_name_kanaのフリガナは、全角（カタカナ）でなければ登録できない' do
      @user.last_name_kana = 'a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end

    it 'passwordは英数字混合でなければ登録できない' do
      @user.password = "ああああああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")   
    end

  end  
end  