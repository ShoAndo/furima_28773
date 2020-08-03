require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it '全てが形式通り入力されていると、登録できる' do
        expect(@user).to be_valid
      end
      it 'nicknameが40文字いないだと登録できる' do
        @user.nickname = 'sample'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上だと登録できる' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        expect(@user).to be_valid
      end
      it '名字と名前の形式が正しければ登録できる' do
        @user.last_name = '太郎'
        @user.first_name = '山田'
        expect(@user).to be_valid
      end
      it 'フリガナがカタカナであれば登録できる' do
        @user.kana_first_name = 'ヤマダ'
        @user.kana_last_name = 'タロウ'
        expect(@user).to be_valid
      end
      it '生年月日が正しく入力されていれば登録できる' do
        @user.birth_date = '2000-03-03'
        expect(@user).to be_valid
      end
    end

    context 'ユーザー登録ができない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空だと登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'emailが重複していると登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空だと登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passeordが5文字以下だと登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordはあるが、password_confirmationが空だと登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it '名字が空だと登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end
      it '名前が空だと登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください。')
      end
      it '名字が全角意外だと登録できない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name は全角で入力してください。')
      end
      it '名前が全角漢字以外だと登録できない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name は全角で入力してください。')
      end
      it '名字のフリガナが空だと登録できない' do
        @user.kana_first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name は全角カタカナで入力して下さい。')
      end
      it '名前のフリガナが空だと登録できない' do
        @user.kana_last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name は全角カタカナで入力して下さい。')
      end
      it '名字のフリガナがカタカナ以外だと登録できない' do
        @user.kana_first_name = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana first name は全角カタカナで入力して下さい。')
      end
      it '名前のフリガナがカタカナ以外だと登録できない' do
        @user.kana_last_name = 'てすと'
        @user.valid?
        expect(@user.errors.full_messages).to include('Kana last name は全角カタカナで入力して下さい。')
      end
      it '生年月日が空だと登録できない' do
        @user.birth_date = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end
    end
  end
end
