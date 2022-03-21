FactoryBot.define do
  factory :room do
    association :booking
    user_id { Faker::Number.digit }
  end
end
