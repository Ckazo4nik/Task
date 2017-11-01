require 'rails_helper'


feature 'Create Advert' , %q{
    Я як залогінений користувач можу створювати
    оголошення
} do
  scenario 'Створення оголошення' do
    visit adverts_path
    click_on 'Створити оголошення'
    fill_in 'Title', with: 'Ogolosh'
    fill_in 'Body', with: 'Ogolosh2'
    click_on 'Створити'

    expect(page).to have_content 'Ваше оголошення було створено'
  end
end