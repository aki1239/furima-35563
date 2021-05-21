require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
    sleep 0.1
  end
  context '内容に問題がない場合' do
    it "各項目埋まっていれば購入できる" do
      expect(@order_address).to be_valid
    end
    it "priceとtokenがあれば保存ができること" do
      expect(@order_address).to be_valid
    end
    it "building_nameが空でも登録できる" do
      expect(@order_address).to be_valid
      @order_address.building_name = ''
    end
  end
  context '内容に問題がある場合' do
    it 'post_codeが空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code can't be blank")
    end
    it 'prefecture_idが1では購入できない' do
        @order_address.prefecture_id = 1
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end
    it 'cityが空では購入できい' do
        @order_address.city = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("City can't be blank")
    end
    it 'home_numberが空では購入できない' do
        @order_address.home_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Home number can't be blank")
    end
    it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end
    it "tokenが空では登録できないこと" do
      @order_address.token = ''
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
    it 'post_codeに-がないと購入できない' do
        @order_address.post_code = '111111'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
    end
    it 'phone_numberは11桁でないと購入できない' do
        @order_address.phone_number = 111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end
    it 'phone_numberが半角数字のみでは購入できない' do
        @order_address.phone_number = 111111
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが全角数字だと購入できない' do
       @order_address.phone_number = '１１１１'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが12桁以上だと購入できない' do
       @order_address.phone_number = 111111222222
       @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end





    




  end
end
