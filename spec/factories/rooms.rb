FactoryBot.define do
  factory :room do
    association :booking
    user_id { User.take.id } # usersテーブルにレコードが1件以上ある前提
  end
end
