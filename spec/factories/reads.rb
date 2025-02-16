FactoryBot.define do
  factory :read do
    association :user
    association :book
  end
end
