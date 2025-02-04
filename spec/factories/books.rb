FactoryBot.define do
  factory :book do
    title              { Faker::Commerce.name }
    publisher          { Faker::Company.name }
    genre_id           { Faker::Number.between(from: 2, to: 10) }
    detail             { Faker::Lorem.sentence }
    recommended        { Faker::Lorem.sentence }
    reference          { Faker::Internet.url }
    user 
  end
end