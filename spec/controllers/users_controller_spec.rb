require 'rails_helper'
require 'spec_helper'

describe UsersController do
  describe "POST create" do
    context "with valid input" do
      before do
        post :create, user: { user: { email: "mike@me.com", full_name: "Mike", password: "pasword" } }
      end
      
      it "creates a new user" do
        expect(User.count).to eq(1)
      end
    end
    context "with invalid input"
  end
end
