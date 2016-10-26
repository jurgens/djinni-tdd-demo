FactoryGirl.define do
  factory :developer do
    city
    sequence(:title)  { |n| "developer title #{n}" }
    skills            { 'java, ruby, backbone.js' }
    salary            1777
    experience        7
    english           5
    description       { FFaker::Lorem.paragraph 2 }
  end
end
