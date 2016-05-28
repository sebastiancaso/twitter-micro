FactoryGirl.define do
  factory :tweet do
    tweet_text { Faker::Lorem.words(5) }
    tweet_subject "Healthcare"
    tweet_id { Faker::Number.number(1) }
  end
end
