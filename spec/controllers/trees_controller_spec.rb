# spec/controllers/trees_controller_spec.rb

require 'rails_helper'

RSpec.describe TreesController, type: :controller do
  include Devise::Test::ControllerHelpers
  
  describe "GET #index" do
    before do
      @user = FactoryBot.create(:user)
      sign_in @user
    end

    it "returns a success response" do
      get :index
      expect(response).to be_successful # This checks for a 2xx status code
    end
  end
end
