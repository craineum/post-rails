# frozen_string_literal: true

FactoryBot.define do
  factory :api_user, parent: :json_base do
    json_reference_string do
      '
        {
          "emails": [],
          "id": "397542",
          "name": "Monkey"
        }
      '
    end

    sequence(:id, &:to_s)

    emails { [association(:email)] }
    name { Faker::Name.name }
  end
end
