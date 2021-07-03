class Order < ApplicationRecord
  include ActiveModel::Model
  attr_accessor :customer_id, :prefecture_id, :city, :house_number, :building_name

# ⇩ 購入金額の入力が必須となるのバリデーション
  #validates :price, presence: true
  belongs_to :user,optional: true

  def save
    sell_item = SellItem.create(user_id: user_id, buy_item_id: buy_item_id)
    Address.create(postal_code: postal_code, shipping_orig_id: shipping_orig_id, city: city, address_other: address_other, building_name: building_name,telephone_num: telephone_num, sell_item_id: sell_item.id )
  end

end
