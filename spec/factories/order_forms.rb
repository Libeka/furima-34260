FactoryBot.define do
  factory :order_form do
    
    # destination{"あ"}
    # purchase_record{"あ"}
    zip_code{"123-4567"}
    city{"あ"}
    address{"1"}
    phone_number{"09012345678"}
    # card_number{"1"}
    # card_exp_month{"1"}
    # card_exp_year{"1"}
    # card_cvc{"1"}
    token {"tok_abcdefghijk00000000000000000"}
    
    prefecture_id{2}
    
    
    
  end
end
