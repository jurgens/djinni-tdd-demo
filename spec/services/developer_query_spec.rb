require 'rails_helper'

describe DeveloperQuery do
  context 'search' do

    before do
      @ruby_developer = create :developer, title: 'Ruby developer'
      @java_developer = create :developer, title: 'Java developer'
    end

    specify 'by keyword' do
      params = {
        keyword: 'ruby'
      }

      results = DeveloperQuery.call params

      expect(results).to include(@ruby_developer)
      expect(results).to_not include(@java_developer)
    end
  end
end
