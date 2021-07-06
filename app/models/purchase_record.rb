class PurchaseRecord < ApplicationRecord
 

  belongs_to :user,optional: true
  belongs_to :product
  has_one :destination


  def save
    sell_item = SellItem.create(user_id: user_id, product: product )
    Address.create(postal_code: postal_code, shipping_orig_id: shipping_orig_id, city: city, address_other: address_other, building_name: building_name,telephone_num: telephone_num, sell_item_id: sell_item.id )
  end
end
