require 'rails_helper'

describe 'Search for developers by city' do
  context 'search' do
    before do
      @odessa = create :city, name: 'Odessa'
      @kyiv = create :city, name: 'Kyiv'

      @odessa_developer = create :developer, city: @odessa, title: 'Odessa Developer'
      @kyiv_developer = create :developer, city: @kyiv, title: 'Kyiv dev'
    end

    specify 'by city' do
      visit developers_path

      expect(page).to have_link 'Odessa'
      expect(page).to have_link 'Kyiv'

      click_on 'Odessa'

      within '.cities' do
        expect(page).to have_css '.selected', text: 'Odessa'
        expect(page).to_not have_selector 'a', text: 'Odessa'
      end
    save_and_open_page

      expect(page).to have_content @odessa_developer.title
      expect(page).to_not have_content @kyiv_developer.title
    end
  end
end
