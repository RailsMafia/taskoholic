FactoryGirl.define do

  factory :project do |p|
    p.name Faker::Company.name
    p.description Faker::Lorem.paragraph
  end

end
