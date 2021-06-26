FactoryBot.define do
  factory :product do
    #nickname {Faker::Name.initials(number: 2)}
    #email {Faker::Internet.free_email}
    #password = '1a' + Faker::Internet.password(min_length: 6)
    #password {password}
    #password_confirmation {password}
    item_name{"あ"}
    item_info{"あ"}
    category_id{"ア"}
    status_id{"ア"}
    shipping_fee_status_id{"ア"}
    prefecture_id{"ア"}
    scheduled_delivery_id{"ア"}
    item_price {"ア"}
    user_id {"ア"}
  end
end
