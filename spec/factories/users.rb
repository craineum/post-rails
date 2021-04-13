FactoryBot.define do
  factory :user do
    address { Faker::Address.full_address }
    email { Faker::Internet.safe_email }
    name { Faker::Name.name }
  end
end
