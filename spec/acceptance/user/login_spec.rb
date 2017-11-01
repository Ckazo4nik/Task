require 'rails_helper'

feature 'Логін користувача', %q{
  Я,як зареєстрований користувач
  маю можливість залогінитись на
  сайті
} do
    given(:user) { create(:user) }
    scenario 'Не зареєстрований користувач, невірні дані' do
      visit root_path
      click_on 'sign_in'
      fill_in 'Email', with: 'wrong228@login'
      fill_in 'Password', with: '12345678'
      click_on 'Log in'

      expect(page).to have_content 'Invalid Email or password'
      expect(current_path).to eq new_user_session_path
    end
    scenario 'Успішний вхід' do
      sign_in(user)
      expect(page).to have_content 'Signed in successfully'
    end
  end