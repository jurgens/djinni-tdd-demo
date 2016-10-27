require 'rails_helper'

describe 'Search for developers by city' do
  before do
    @odessa = create :city, name: 'Odessa'
    @kyiv = create :city, name: 'Kyiv'

    @odessa_developer = create :developer, city: @odessa, title: 'Odessa Ruby Developer'
    @kyiv_developer = create :developer, city: @kyiv, title: 'Kyiv dev'
  end

  context 'search' do
    specify 'should show cities list' do
      visit developers_path

      expect(page).to have_link 'Odessa'
      expect(page).to have_link 'Kyiv'

      click_on 'Odessa'

      within '.cities' do
        expect(page).to have_css '.selected', text: 'Odessa'
        expect(page).to_not have_selector 'a', text: 'Odessa'
      end
    end

    specify 'by city' do
      visit developers_path

      click_on 'Odessa'

      expect(page).to have_content @odessa_developer.title
      expect(page).to_not have_content @kyiv_developer.title
    end
  end

  context 'when both city and keyword specified' do
    before { @odessa_java_developer = create :developer, city: @odessa, title: 'Odessa Java Developer' }

    specify do
      visit developers_path

      fill_in 'keyword', with: 'ruby'
      click_button 'Search'
      click_on 'Odessa'

      expect(page).to have_content @odessa_developer.title
      expect(page).to_not have_content @kyiv_developer.title
      expect(page).to_not have_content @odessa_java_developer.title
    end
  end
end
