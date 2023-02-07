require 'rails_helper'
RSpec.describe Message, type: :model do
  before do
    @message = FactoryBot.build(:message)
  end

  describe 'メッセージの保存' do
    context 'メッセージが投稿できる' do
      it 'メッセージか画像が存在すれば投稿できる' do
        expect(@message).to be_valid
      end
      it 'contentが空でも保存できる' do
        @message.content = ''
        expect(@message).to be_valid
      end
      it 'imageが空でも保存できる' do
        @message.image = nil
        expect(@message).to be_valid
      end
    end
    context 'メッセージが投稿できない場合' do
      it 'contentとimageが空では保存できない' do
        @message.content = ''
        @message.image = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "Contentを入力してください"
      end
      it 'roomが紐付いていないと保存できない' do
        @message.room = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "Roomを入力してください"
      end
      it 'userが紐付いていないと保存できない' do
        @message.user = nil
        @message.valid?
        expect(@message.errors.full_messages).to include "Userを入力してください"
      end
    end
  end
end
