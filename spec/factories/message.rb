FactoryBot.define do
  factory :message do
    content {Faker::Lorem.sentence}
    association :user
    association :room

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/back_img.png'), filename: 'back_img.png')
    end
  end
end