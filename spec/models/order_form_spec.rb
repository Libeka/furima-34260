require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  
  describe "商品購入機能" do
    before do
      # ↓ 1つ前の問題で設定したインスタンスを生成する
      @order_form = FactoryBot.build(:order_form)
    end

    describe '商品購入機能' do
      context '新規登録がうまくいくとき' do
        
      end
  

      context '新規登録と購入履歴がうまくいかないとき' do
        it "配送先が空だと登録できない" do
          @order_form .destination = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Destination can't be blank", "Purchase record can't be blank")
        end
      end
    end
  end
end
