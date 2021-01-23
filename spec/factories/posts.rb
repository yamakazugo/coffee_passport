FactoryBot.define do
  factory :post do
    name                     {"コーヒー"}
    info                     {Faker::Lorem.sentence}
    flavor_id                {3}
    region_id                {3}
    body_id                  {3}
    acidity_id               {3}
    processing_id            {3}
    text                     {"シナモン"}
    association :user

    after(:build) do |post|
      post.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
