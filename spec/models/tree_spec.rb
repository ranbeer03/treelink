require 'rails_helper'

RSpec.describe Tree, type: :model do
  it 'is valid with valid attributes' do
    user = FactoryBot.create(:user) # You need to define this factory.
    tree = Tree.new(name: 'My Unique Tree', instagram: 'https://instagram.com/mytree', youtube: 'https://youtube.com/mytree', x: 'https://mywebsite.com/mytree', user: user)
    expect(tree).to be_valid
  end

  it 'is not valid without a name' do
    tree = Tree.new
    expect(tree).not_to be_valid
    expect(tree.errors[:name]).to include("can't be blank")
  end

  it 'is not valid with a duplicate name' do
    user = FactoryBot.create(:user) # Assuming user factory is defined.
    Tree.create!(name: 'UniqueName', user: user)
    tree = Tree.new(name: 'UniqueName', user: user)
    expect(tree).not_to be_valid
    expect(tree.errors[:name]).to include("has already been taken")
  end

  # Add more tests for instagram, youtube, and x validations
end
