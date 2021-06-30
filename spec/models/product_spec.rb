require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    # ↓ 1つ前の問題で設定したインスタンスを生成する
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'すべての情報があれば登録できる' do
        expect(@product).to be_valid
      end
  
    end

    context '商品出品がうまくいかないとき' do

      it "商品名が空だと登録できない" do
        @product.item_name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item name can't be blank")
      end

      it "商品の説明が空だと登録できない" do
        @product.item_info = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item info can't be blank")
      end

      it "商品の画像が空だと登録できない" do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it "商品の状態が--を選択していると登録できない" do
        @product.status_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Status must be other than 1")
      end

      it "配送料の負担が--を選択していると登録できない" do
        @product.shipping_fee_status_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee status is not a number")
      end

      it "発送元の地域が--を選択していると登録できない" do
        @product.prefecture_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture is not a number")
      end

      it "発送までの日数が--を選択していると登録できない" do
        @product.scheduled_delivery_id = "--"
        @product.valid?
        expect(@product.errors.full_messages).to include("Scheduled delivery is not a number")
      end

      it "カテゴリーが--を選択していると登録できない" do
        @product.category_id = 1
        @product.valid?
        expect(@product.errors.full_messages).to include("Category must be other than 1")
      end

      it "販売価格が空だと登録できない" do
        @product.item_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "販売価格が299円以下だと登録できないこと" do
        @product.item_price = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price is not included in the list")
      end

      it "販売価格が10,000,000円以上だと登録できないこと" do
        @product.item_price = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price is not included in the list")
      end

      it "販売価格が半角英字のみだと登録できないこと" do
        @product.item_price = "aaaa"
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price is not included in the list")
      end

      it "販売価格が半角英数字混合だと登録できないこと" do
        @product.item_price = "aa11"
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price is not included in the list")
      end

      it "販売価格が全角数字だと登録できないこと" do
        @product.item_price = "１１１１"
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price is not included in the list")
      end
    end

  end
end
