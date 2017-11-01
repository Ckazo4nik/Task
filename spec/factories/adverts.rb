FactoryBot.define do
  factory :advert do
    title "MyString"
    body "MyText"
    association :user, factory: :user
  end
end
