require 'rails_helper'

RSpec.feature "UserCreatesTree", type: :feature do
  before do
    user = FactoryBot.create(:user) # Define this factory.
    login_as(user, scope: :user)
  end

  scenario "User creates a new tree" do
    visit "/trees/new"
    fill_in "name", with: "My Awesome Tree" # Assuming the input's name or ID attribute is 'tree_name'.
    fill_in "instagram", with: "https://instagram.com/myawesome"
    # Fill in other fields as necessary.
    click_button "Create Tree"
    expect(page).to have_text("Tree was successfully created.")
  end
end
