require 'rails_helper'

describe 'Developer Search' do
  context 'search' do
    before do
      @dev1 = create :developer, title: 'Ruby on Rails developer'
      @dev2 = create :developer, title: 'Java developer'
    end

    specify 'by keyword in a title' do
      visit developers_path

      fill_in 'keyword', with: 'ruby'
      click_button 'Search'

      expect(page).to have_field('keyword', with: 'ruby')

      expect(page).to have_content @dev1.title
      expect(page).to_not have_content @dev2.title
    end
  end
end
