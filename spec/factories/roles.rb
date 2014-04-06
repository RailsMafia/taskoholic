# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do

  factory :role do
    name 'Owner'

    factory :notvalid_role do
      name nil
    end
  end

end
