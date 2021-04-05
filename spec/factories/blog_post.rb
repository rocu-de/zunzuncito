FactoryBot.define do
  factory :blog_post do
    website
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraphs(number: 10).join("\n\n") }
    path { "/#{Faker::Internet.slug}" }

    trait :with_created_at do
      created_at { Faker::Time.backward(days: 14) }
    end
  end
end
