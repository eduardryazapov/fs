FactoryGirl.define do
  factory :feedback do
    email
    name { Faker::Name.name }
    text { Faker::Lorem.paragraph }
  end
end
