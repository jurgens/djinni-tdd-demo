FactoryGirl.define do
  factory :developer do
    city
    title       { FFaker::Lorem.phrase }
    skills      { FFaker::Lorem.words 5 }
    salary      { rand(1000) + 500 }
    experience  ( rand(10) )
    english     { rand 10 }
  end
end
