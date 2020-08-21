require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nickname,email,password,姓名、フリガナ、誕生日があれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していては登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに＠がなければ登録できない' do
        @user.email = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下だと登録できない' do
        @user.password = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordは半角英数混合でないと登録できない' do
        @user.password = 'testtest'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordはpassword_confirmationと同一でないと登録できない' do
        @user.password = "#{@user.password}test"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'name_firstが空だと登録できない' do
        @user.name_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name first can't be blank")
      end
      it 'name_lastが空だと登録できない' do
        @user.name_last = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name last can't be blank")
      end
      it 'name_firstが漢字・ひらがな・カタカナ以外だと登録できない' do
        @user.name_first = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name first is invalid')
      end
      it 'name_lastが漢字・ひらがな・カタカナ以外だと登録できない' do
        @user.name_last = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name last is invalid')
      end
      it 'name_kana_firstが空だと登録できない' do
        @user.name_kana_first = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana first can't be blank")
      end
      it 'name_kana_lastが空だと登録できない' do
        @user.name_kana_last = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Name kana last can't be blank")
      end
      it 'name_kana_firstがカタカナ以外だと登録できない' do
        @user.name_kana_first = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana first is invalid')
      end
      it 'name_kana_lastがカタカナ以外だと登録できない' do
        @user.name_kana_last = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Name kana last is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
