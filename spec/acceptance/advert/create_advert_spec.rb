require 'rails_helper'


feature 'Create Advert' , %q{
    Я як залогінений користувач можу створювати
    оголошення
} do
  given(:user) { create(:user) }
  scenario 'Створення оголошення' do
    sign_in(user)
    visit root_path
    click_on 'Створити оголошення'
    fill_in 'Заголовок', with: 'Ogolosh'
    fill_in 'Короткий опис', with: 'Ogolosh2'
    fill_in 'Текст', with: 'Ogolosh2'
    click_on 'Створити'

    expect(page).to have_content 'Advert was successfully created'
  end
  scenario 'Створення оголошення невалідного' do
    sign_in(user)
    visit root_path
    click_on 'Створити оголошення'
    fill_in 'Заголовок', with: ''
    fill_in 'Короткий опис', with: 'Ogolosh2'
        fill_in 'Текст', with: 'Ogolosh2'
    click_on 'Створити'

    expect(page).to have_content 'can\'t be blank'
  end
  scenario 'Не залогінений користува створює оголошення' do
    visit root_path
    click_on 'Створити оголошення'

    expect(page).to have_content 'You need to sign in or sign up before continuing.'
  end
end
