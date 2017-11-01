require 'rails_helper'

feature 'Реєстрація нового користувача', %q{
  Я, як не залогінений новий користувач
  хочу зареєструватися, і мати доступ до всіх
  можливостей цього додатку
} do
  scenario 'Реєстрація валідного користувача' do
    visit root_path
    click_on 'Login'
    fill_in 'Ваш емейл', with: 'User@test.com'
    fill_in 'Ваш пароль', with: '12345678'
    fill_in 'Підтвердіть пароль', with: '12345678'
    click_on 'Зареєструватись'
    expect(page).to have_content 'Welcome! You have signed up successfully'
  end
  scenario 'Реєстрація  не валідного користувача' do
    visit root_path
    click_on 'Login'
    fill_in 'Ваш емейл', with: ''
    fill_in 'Ваш пароль', with: '12345678'
    fill_in 'Підтвердіть пароль', with: '12345678'
    click_on 'Зареєструватись'
    expect(page).to have_content 'Email can\'t be blank'
  end
end