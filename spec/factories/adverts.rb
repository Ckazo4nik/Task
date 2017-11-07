FactoryBot.define do
  factory :advert do
    title "MyString"
    body "MyText"
    summary "MyText"
    association :user, factory: :user
  end
end
