FactoryBot.define do
  sequence :email do |n|
    "user#{n}@test.com"
  end
  sequence :username do |n|
    "user#{n}"
  end
  factory :user do
    username
    email
    full_name 'Юзер Нейм'
    city 'Lviv'
    state 'Lviv'
    country 'Ukraine'
    birthday '11 10 1999'
    password '12345678'
    password_confirmation '12345678'
  end
end
