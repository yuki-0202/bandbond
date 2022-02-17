FactoryBot.define do
  factory :booking do
    area { Area.where.not(id: 1).sample }
    genre { Genre.where.not(id: 1).sample }
    date_start { Date.today }
    date_end { Faker::Date.forward(days: 365) }
    venue { Faker::Lorem.word }
    detail { Faker::Lorem.sentence }
    association :user
  end
end