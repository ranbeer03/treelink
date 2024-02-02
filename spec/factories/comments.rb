FactoryBot.define do
  factory :comment do
    content { "MyText" }
    tree { nil }
    user { nil }
  end
end
