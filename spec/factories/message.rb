include ActionDispatch::TestProcess

FactoryGirl.define do

  factory :message do
    body        { Faker::Lorem.sentence }
    image       { fixture_file_upload("#{::Rails.root}/spec/fixtures/000panda.jpg", 'image/jpg') }
    group_id    "1"
    user_id     "1"
    end

  trait :with_user_and_group do
     user
     group
  end
end
