FactoryGirl.define do
  factory :project do
    name { Faker::Lorem.characters(rand(4..30)) }
	description { Faker::Lorem.paragraph }
    association :owner, factory: :user
    
    factory :invalid_project do
      name nil
    end
  end
end
