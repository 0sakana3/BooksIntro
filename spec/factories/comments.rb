FactoryBot.define do
  factory :comment do
    text           { Faker::Lorem.word }
    
    association :user

  end
end
