require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('public/images/indigolaend.jpg')
  end
  describe '新規出品' do
    context '出品できるとき' do
      it '全ての形式が正しいとき出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it '画像がないと出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '名前がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '内容がないと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category must be other than 1')
      end
      it 'item_status_idが1だと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Item status must be other than 1')
      end
      it 'delivery_burden_idが1だと出品できない' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery burden must be other than 1')
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Prefecture must be other than 1')
      end
      it 'send_date_idが1だと出品できない' do
        @item.send_date_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Send date must be other than 1')
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it 'priceが300円以上9999999円以下でないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
