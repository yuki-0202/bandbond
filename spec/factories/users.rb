FactoryBot.define do
  factory :user do
    nickname { Faker::Name.name }
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password { password }
    password_confirmation { password }
    birthday { Faker::Date.birthday(min_age: 18, max_age: 60) }
    sex { Sex.all.sample }
    genre { Genre.where.not(id: 1).sample }
    area { Area.where.not(id: 1).sample }
    part { Part.all.sample }
    introduction { Faker::Lorem.sentence }

    after(:build) do |user|
      user.image.attach(io: File.open('public/images/test_neko.webp'), filename: 'test_neko.webp')
    end
  end
end
