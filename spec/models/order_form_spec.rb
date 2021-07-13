require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  
  describe "商品購入機能" do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product, user_id: user.id)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, product_id: product.id)
      sleep 0.1
    end

    describe '商品購入機能' do
      context '商品購入がうまくいくとき' do

        it '全ての値が正しく入力されていれば購入できること' do
          expect(@order_form).to be_valid
        end

        it "tokenがあれば保存ができること" do
          expect(@order_form).to be_valid
        end
        
      end
  

      context '商品購入がうまくいかないとき' do
        
        # it "配送先が空だと登録できない" do
        #   @order_form.destination = ''
        #   @order_form.valid?
        #   expect(@order_form.errors.full_messages).to include("Destination can't be blank")
        # end

        #it "購入情報が空だと登録できない" do
          #@order_form.purchase_record = ''
          #@order_form.valid?
          #expect(@order_form.errors.full_messages).to include("Purchase record can't be blank", "Purchase record can't be blank")
        #end

        #it "クレジットカード番号が空だと登録できない" do
          #@order_form.card_number= ''
          #@order_form.valid?
          #expect(@order_form.errors.full_messages).to include("Card number can't be blank")
        #end

        #it "有効期限(月)が空だと登録できない" do
          #@order_form.card_exp_month= ''
          #@order_form.valid?
          #expect(@order_form.errors.full_messages).to include("Card exp month can't be blank")
        #end

        #it "有効期限(年)が空だと登録できない" do
          #@order_form.card_exp_year= ''
          #@order_form.valid?
          #expect(@order_form.errors.full_messages).to include("Card exp year can't be blank")
        #end

        #it "セキュリティコードが空だと登録できない" do
          #@order_form.card_cvc= ''
          #@order_form.valid?
          #expect(@order_form.errors.full_messages).to include("Card cvc can't be blank")
        #end

        it "郵便番号の保存にはハイフンが必要であること" do
          @order_form.zip_code= '1234567'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Zip code is invalid. Include hyphen(-)")
        end

        it "市区町村が空だと登録できない" do
          @order_form.city= ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("City can't be blank")
        end

        it "番地が空だと登録できない" do
          @order_form.address= ''
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Address can't be blank")
        end

        it "電話番号は11桁以内の数値のみ保存可能なこと" do
          @order_form.phone_number= '090123456789'
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Phone number is too long (maximum is 11 characters)")
        end

        it "都道府県が--を選択していると登録できない" do
          @order_form.prefecture_id = 1
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Prefecture must be other than 1")
        end

        it "tokenが空では登録できないこと" do
          @order_form.token = nil
          @order_form.valid?
          expect(@order_form.errors.full_messages).to include("Token can't be blank")
        end

        




      end
    end
  end
end

#bundle exec rspec spec/models/order_form_spec.rb

