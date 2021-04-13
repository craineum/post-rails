# frozen_string_literal: true

FactoryBot.define do
  factory :api_email, parent: :json_base do
    json_reference_string do
      '
        {
          "email": "monkey@banana.com",
          "is_primary": true
        }
      '
    end

    email { Faker::Internet.safe_email }
    is_primary { true }
  end
end
