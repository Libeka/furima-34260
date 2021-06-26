require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    # ↓ 1つ前の問題で設定したインスタンスを生成する
    @product = FactoryBot.build(:product)
  end
end
