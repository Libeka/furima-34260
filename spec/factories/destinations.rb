FactoryBot.define do
  factory :destination do
    
    item_name{"あ"}
    item_info{"あ"}
    category_id{2}
    status_id{2}
    shipping_fee_status_id{2}
    prefecture_id{2}
    scheduled_delivery_id{2}
    item_price {300}
    
  end
end
