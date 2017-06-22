FactoryGirl.define do

  factory :user do
    name                    { Faker::Name.name }
    email                   { Faker::Internet.email }
    password                { Faker::Internet.password }
    password_confirmation   { Faker::Internet.password }
   end
end
