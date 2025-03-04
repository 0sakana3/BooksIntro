FactoryBot.define do
  factory :book do
    title              { Faker::Book.title[0...30] }
    publisher          { Faker::Company.name[0...30] }
    genre_id           { Faker::Number.between(from: 2, to: 10) }
    detail             { Faker::Lorem.sentence }
    recommended        { Faker::Lorem.sentence }
    reference          { Faker::Internet.url }

    association :user

    after(:build) do |book|
      book.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
