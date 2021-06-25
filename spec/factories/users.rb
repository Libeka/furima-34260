FactoryBot.define do
  factory :user do
    nickname {Faker::Name.initials(number: 2)}
    email {Faker::Internet.free_email}
    password = '1a' + Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    last_name{"あ"}
    first_name{"あ"}
    last_name_kana{"ア"}
    first_name_kana{"ア"}
    birth_day{"1930_01_01"}

  end
end