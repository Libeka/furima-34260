FactoryBot.define do
  factory :order_form do
    
    zip_code{"123-4567"}
    city{"あ"}
    address{"1"}
    phone_number{"09012345678"}
    building_name{"あ102"}
    token {"tok_abcdefghijk00000000000000000"}
    
    prefecture_id{2}
    
    
    
  end
end
