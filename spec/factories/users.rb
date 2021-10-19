FactoryBot.define do
  factory :post do
    first_name { Faker::Name.unique.name }
    last_name { Faker::Name }
    id { Faker::Number.unique.number }
    email {Faker::Internet.email.unique}
    created_at {Faker::Date.in_date_period(month: 2)}
  end
end
