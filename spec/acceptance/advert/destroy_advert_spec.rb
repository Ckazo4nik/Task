require 'rails_helper'

feature 'видалення оголошення', %q{
  Користувач може видалити своє оголошення
} do
  given!(:user) { create(:user) }
  given!(:advert) { create(:advert,user_id: user.id)}
  scenario 'Користувач удаляє своє оголошення' do
    sign_in(user)
    visit root_path
    click_on 'видалити'
    save_and_open_page
    expect(page).to_not have_content advert.title
    end
  scenario 'не видно силку видалити' do
    visit root_path
    expect(page).to_not have_content 'видалити'
  end
end
