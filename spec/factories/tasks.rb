FactoryGirl.define do
  factory :task do
    name { Faker::Lorem.characters(rand(4..30)) }
	  description { Faker::Lorem.paragraph }
    association :project

    factory :invalid_task do
      name nil
    end
  end
end
