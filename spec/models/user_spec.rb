require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with valid attributes' do
    user = User.new(email: 'user@example.com', password: 'Password123!')
    expect(user).to be_valid
  end

  it 'is not valid without an email' do
    user = User.new(password: 'Password123!')
    expect(user).not_to be_valid
    expect(user.errors[:email]).to include("can't be blank")
  end

  # Add more tests for password validations
end
