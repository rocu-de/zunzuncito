FactoryBot.define do
  factory :website do
    title { Faker::Lorem.words(2).join(' ') }
    base_url { Faker::Internet.url(path: '/') }
    theme { 'archie' }
  end
end
