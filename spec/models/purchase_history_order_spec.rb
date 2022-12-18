require 'rails_helper'

RSpec.describe PurchaseHistoryOrder, type: :model do
  describe '商品購入' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @purchase_history_order = FactoryBot.build(:purchase_history_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '購入できる場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@purchase_history_order).to be_valid
      end
      it 'building_nameは空でも保存できること' do
        @purchase_history_order.building_name = ''
        expect(@purchase_history_order).to be_valid
      end
    end

    context '購入できない場合' do
      it 'post_codeが空だと保存できないこと' do
        @purchase_history_order.post_code = ''
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できないこと' do
        @purchase_history_order.post_code = '1234567'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Post code is invalid. Enter it as follows (e.g. 123-4567)")
      end
      it 'prefectureを選択していないと保存できないこと' do
        @purchase_history_order.prefecture_id = 1
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空だと保存できないこと' do
        @purchase_history_order.city = ''
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空だと保存できないこと' do
        @purchase_history_order.address = ''
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Address can't be blank")
      end
      it 'tellが空だと保存できないこと' do
        @purchase_history_order.tell = ''
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tellに数字以外が含まれると登録できないこと' do
        @purchase_history_order.tell = 'aaaaaaaaaaa'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Tell is invalid. Input only number")
      end
      it 'tellが9文字以下だと登録できないこと' do
        @purchase_history_order.tell = '000000000'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Tell is too short (minimum is 10 characters)")
      end
      it 'tellが12文字以上だと登録できないこと' do
        @purchase_history_order.tell = '000000000000'
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Tell is too long (maximum is 11 characters)")
      end
      it 'userが紐付いていないと保存できないこと' do
        @purchase_history_order.user_id = nil
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("User can't be blank")
      end
      it 'itemが紐付いていないと保存できないこと' do
        @purchase_history_order.item_id = nil
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空だと保存できないこと' do
        @purchase_history_order.token = nil
        @purchase_history_order.valid?
        expect(@purchase_history_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
