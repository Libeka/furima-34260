require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    # ↓ 1つ前の問題で設定したインスタンスを生成する
    @product = FactoryBot.build(:product)
  end
  
    describe '商品出品' do
      it 'nicknameとemail、passwordとpassword_confirmationが存在すれば登録できること' do
      end
  
      it 'nicknameが空では登録できないこと' do
      end
  
      it 'emailが空では登録できないこと' do
      end
  
      it '重複したemailが存在する場合登録できないこと' do
      end
  
      it 'passwordが空では登録できないこと' do
      end
  
      it 'passwordが5文字以下であれば登録できないこと' do
      end
  
      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      end
  end
end
