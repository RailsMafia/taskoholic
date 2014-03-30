FactoryGirl.define do
  factory :user do |u|
    paswd = Faker::Internet.password
    u.name Faker::Name.name
    u.email Faker::Internet.email
    u.password paswd
    u.password_confirmation paswd
  end

  factory :notvalid_user, parent: :user do |u|
    u.name nil
    u.email ''
    u.password 'short'
    u.password_confirmation 'do not match'
  end
end
