FactoryGirl.define do
  factory :user do |u|
    u.name { Faker::Name.first_name }
    u.email {Faker::Internet.email}
    u.password {'password'}
  end
  
  factory :project do |p|
    p.name { 'name' }
    p.description {'description'}
  end
end