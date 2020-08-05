require 'rails_helper'

RSpec.describe UserPay, type: :model do
  before do
    @user_pay = FactoryBot.build(:user_pay)
  end
  describe '購入機能' do
    context '購入できるとき' do
      it '全ての形式が正しいとき購入できる' do
        expect(@user_pay).to be_valid
      end
      it '郵便番号の書式が正しいと購入できる' do
        @user_pay.post_number = '111-2222'
        expect(@user_pay).to be_valid
      end
      it '建物名はなくても購入できる' do
        @user_pay.building = ""
        expect(@user_pay).to be_valid
      end
      it '電話番号が11桁以内だと購入できる' do
        @user_pay.phone_number = "09012345667"
        expect(@user_pay).to be_valid
      end
    end
    context '購入できないとき' do
      it '郵便番号が空だと購入できない' do
        @user_pay.post_number = ""
        @user_pay.valid?
        expect(@user_pay.errors.full_messages).to include("Post number can't be blank")
      end
      it '郵便番号の形式が異なると購入できない' do
        @user_pay.post_number = "1111111"
        @user_pay.valid?
        expect(@user_pay.errors.full_messages).to include('Post number is invalid. Include hyphen(-)')
      end
      it '都道府県が選択されてないと購入できない' do
        @user_pay.prefecture_id = 1
        @user_pay.valid?
        expect(@user_pay.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it '市町村区が空だと購入できない' do
        @user_pay.city = ""
        @user_pay.valid?
        expect(@user_pay.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @user_pay.address = ""
        @user_pay.valid?
        expect(@user_pay.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @user_pay.phone_number = ""
        @user_pay.valid?
        expect(@user_pay.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号の形式が異なると購入できない' do
        @user_pay.phone_number = "090-1122-3333"
        @user_pay.valid?
        expect(@user_pay.errors.full_messages).to include('Phone number is invalid. Max length is 11 numbers')
      end
    end
  end
end
