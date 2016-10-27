require 'rails_helper'

describe ApplicationHelper do
  context 'experience' do
    it 'should' do
      expect(helper.experience(0)).to eq 'less than 1 year'
      expect(helper.experience(1)).to eq '1 year'
      expect(helper.experience(2)).to eq '2 years'
      expect(helper.experience(3)).to eq '3 years'
    end
  end
end
