require 'rails_helper'

feature 'Редагування оголошення', %q{
  Автор оголошення може редагувати його
} do
  given!(:user) { create(:user) }
  given!(:advert) { create(:advert, user_id: user.id ) }

  scenario 'не залогінений користува редагує оголошуння' do
    visit root_path
    expect(page).to_not have_content 'Редагувати'
    end
  scenario 'залогінений користува редагує оголошуння' do
    sign_in(user)
    visit root_path
    click_on 'редагувати'
    fill_in 'Заголовок', with: 'Text2'
    fill_in 'Короткий опис', with: 'Text2'
    fill_in 'Текст', with: 'Ogolosh2'
    click_on 'Створити'
    expect(page).to have_content 'Advert was successfully updated'
  end
  scenario 'залогінений користува редагує оголошуння/помилка' do
    sign_in(user)
    visit root_path
    click_on 'редагувати'
    fill_in 'Заголовок', with: nil
    fill_in 'Короткий опис', with: 'Text2'
    fill_in 'Текст', with: 'Ogolosh3'
    click_on 'Створити'

    expect(page).to have_content 'be blank'
  end
end
