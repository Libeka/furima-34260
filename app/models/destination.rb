class Destination < ApplicationRecord
  

  belongs_to :purchase_record

  def save
    Destination.create(user_id: user_id, buy_item_id: buy_item_id)
    #Destination.create(content: params[:content])
    #destination = Destination.create(user_id: user_id, buy_item_id: buy_item_id)
    #Address.create(postal_code: postal_code, shipping_orig_id: shipping_orig_id, city: city, address_other: address_other, building_name: building_name,telephone_num: telephone_num, sell_item_id: sell_item.id )
  end
end
