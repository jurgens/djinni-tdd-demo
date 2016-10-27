require 'rails_helper'

describe 'Developers Index' do
  context 'when I browse for developers page' do
    before do
      @dev = FactoryGirl.create :developer, salary: 1234
    end

    it 'should show all developer details' do
      visit developers_path

      within '.developer' do
        expect(page).to have_content @dev.title
        expect(page).to have_content @dev.city_name
        expect(page).to have_content @dev.skills
        within '.experience' do
          expect(page).to have_content "#{@dev.experience} years"
        end
        expect(page).to have_content '$1,234'
        expect(page).to have_content @dev.description
      end
    end
  end

  context 'when I go to Developers page' do
    before do
      @dev1 = FactoryGirl.create :developer
      @dev2 = FactoryGirl.create :developer
    end

    it 'should show full list of developers' do
      visit root_path
      click_on 'Developers'

      within 'h1' do
        expect(page).to have_content 'Developers'
      end

      expect(page).to have_css('h4', count: 2)

      expect(page).to have_content @dev1.title
      expect(page).to have_content @dev2.title
    end
  end
end
