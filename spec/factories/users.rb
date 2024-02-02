# In spec/factories/users.rb
FactoryBot.define do
  factory :user do
    email { Faker::Internet.unique.email }
    password { "Password123!" }
    # Add any other required fields here.
  end
end
