require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    # ↓ 1つ前の問題で設定したインスタンスを生成する
    @product = FactoryBot.build(:product)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき' do
      it 'ログイン状態のユーザーのみ、商品出品ページへ遷移できること' do
        expect(@product).to be_valid
      end
  
      it 'ログアウト状態のユーザーは、商品出品ページへ遷移しようとすると、ログインページへ遷移すること' do
        expect(@product).to be_valid
      end
  
      it '商品画像を1枚つけることが必須であること' do
        expect(@product).to be_valid
      end

      it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
        expect(@product).to be_valid
      end

      it 'エラーハンドリングができていること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること）' do
        expect(@product).to be_valid
      end

      it 'エラーハンドリングの際、1つのエラーに対して同じエラーメッセージが重複して表示されないこと' do
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
        #@product.item_info = 'nil'
        #@product.valid?
        #expect(@product.errors.full_messages).to include("Item info can't be blank")

        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it "商品の状態が空だと登録できない" do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status is not a number")
      end

      it "配送料の負担が空だと登録できない" do
        @product.shipping_fee_status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping fee status is not a number")
      end

      it "発送元の地域が空だと登録できない" do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture is not a number")
      end

      it "発送までの日数がからだと登録できない" do
        @product.scheduled_delivery_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Scheduled delivery is not a number")
      end

      it "カテゴリーが空だと登録できない" do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category is not a number")
      end

      it "販売価格が空だと登録できない" do
        @product.item_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "販売価格は、¥300~¥9,999,999の間のみ保存可能であること" do
        @product.item_price = :price_lteq, '299',:price_gteq, '10,000,000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "販売価格が299円以下だと登録できないこと" do
        @product.item_price = :price_lteq, '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "販売価格が10,000,000円以上だと登録できないこと" do
        @product.item_price = :price_gteq, '10,000,000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "入力された販売価格によって、販売手数料や販売利益の表示が変わること" do
        @product.item_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "販売価格が半角英字のみだと登録できないこと" do
        @product.item_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "販売価格が半角英数字混合だと登録できないこと" do
        @product.item_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "販売価格が全角数字だと登録できないこと" do
        @product.item_price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Item price can't be blank")
      end

      it "商品の状態が空だと登録できない" do
        @product.status_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Status is not a number")
      end


    end

  end
end
