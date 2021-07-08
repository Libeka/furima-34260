require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  
  describe "商品購入機能" do
    before do
      # ↓ 1つ前の問題で設定したインスタンスを生成する
      @order_form = FactoryBot.build(:order_form)
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do
        
        it '全ての値が正しく入力されていれば購入できること' do
          expect(@order_form).to be_valid
        end
        
      end
  

      context '商品購入がうまくいかないとき' do
        it "配送先が空だと登録できない" do
          @order_form .destination = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Destination can't be blank", "Purchase record can't be blank")
        end

        it "購入情報が空だと登録できない" do
          @order_form .purchase_record = ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Destination can't be blank", "Purchase record can't be blank")
        end

        it "郵便番号が空だと登録できない" do
          @order_form .card_exp_month= ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Postal_code can't be blank")
        end



      end
    end
  end
end

#bundle exec rspec spec/models/order_form_spec.rb

