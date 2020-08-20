require 'rails_helper'

RSpec.describe Message, type: :model do
  describe '#create' do
    before do
      @message = FactoryBot.build(:message)
    end

    it 'contentとimageが存在していれば保存できること' do
      expect(@message).to be_valid
    end

    it 'contentが存在していれば保存できること' do
      @message.image = nil
      expect(@message).to be_valid
    end

    it 'imageが存在していれば保存できること' do
      @message.content = nil
      expect(@message).to be_valid
    end

    it 'contentとimageが空では保存できないこと' do
      @message.content = nil
      @message.image = nil
      @message.valid?
      expect(@message.errors.full_messages.join).to include(I18n.t('errors.messages.blank'))
    end
  end
end
