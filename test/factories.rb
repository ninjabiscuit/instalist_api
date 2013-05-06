FactoryGirl.define do

  factory :list do
    name { Faker::Name.name }
  end

  factory :item do
    name Faker::Name.name
    list { FactoryGirl.create(:list) }
  end

end