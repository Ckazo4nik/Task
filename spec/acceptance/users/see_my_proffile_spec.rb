require 'rails_helper'

feature 'Перегляд профылю', %q{
 Я можу переглянути свій профіль
 Інші користувачі також можуть переглянути мій профіль
} do
  given(:user) { create(:user)}
  given(:admin) { create(:user)}
  given!(:user2) { create(:user)}
  given!(:advert) { create(:advert,user_id: user.id)}
  scenario 'Я переглядаю свій профіль' do
    sign_in(user)
    visit root_path
    click_on 'Мій профіль'

    expect(page).to have_content "Профіль #{user.username}"
  end
  scenario 'Перегляд профіля іншого користувача' do
    sign_in(user2)
    visit root_path
    click_on user.full_name

    expect(page).to have_content "Профіль #{user.username}"

  end
  scenario 'admin see all users' do
    sign_in(admin)
    visit root_path
    click_on 'Всі користувачі'

    expect(page).to have_content "Admin page"
  end

end
