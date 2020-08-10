require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
    @item.images = [fixture_file_upload('public/images/indigolaend.jpg')]
  end
  describe '新規出品' do
    context '出品できるとき' do
      it '全ての形式が正しいとき出品できる' do
        expect(@item).to be_valid
      end
    end
    context '出品できないとき' do
      it '画像がないと出品できない' do
        @item.images = nil
        @item.valid?
        #binding.pry
        expect(@item.errors[:images]).to include(I18n.t('errors.messages.blank'))
      end
      it '名前がないと出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors[:name]).to include(I18n.t('errors.messages.blank'))
      end
      it '内容がないと出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors[:text]).to include(I18n.t('errors.messages.blank'))
      end
      it 'category_idが1だと出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors[:category_id]).to include(I18n.t('errors.messages.other_than',count: 1))
      end
      it 'item_status_idが1だと出品できない' do
        @item.item_status_id = 1
        @item.valid?
        expect(@item.errors[:item_status_id]).to include(I18n.t('errors.messages.other_than',count: 1))
      end
      it 'delivery_burden_idが1だと出品できない' do
        @item.delivery_burden_id = 1
        @item.valid?
        expect(@item.errors[:delivery_burden_id]).to include(I18n.t('errors.messages.other_than',count: 1))
      end
      it 'prefecture_idが1だと出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors[:prefecture_id]).to include(I18n.t('errors.messages.other_than',count: 1))
      end
      it 'send_date_idが1だと出品できない' do
        @item.send_date_id = 1
        @item.valid?
        expect(@item.errors[:send_date_id]).to include(I18n.t('errors.messages.other_than',count: 1))
      end
      it 'priceが空だと出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors[:price]).to include('が可能な範囲を超えています')
      end
      it 'priceが300円以上9999999円以下でないと出品できない' do
        @item.price = 200
        @item.valid?
        expect(@item.errors[:price]).to include("が可能な範囲を超えています")
      end
    end
  end
end
