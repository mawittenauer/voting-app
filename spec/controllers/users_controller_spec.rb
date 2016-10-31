require 'rails_helper'
require 'spec_helper'

INVALID_EMAILS = ['mike.com', '@hello.com', '.com', 'hello']

describe UsersController do
  describe "GET new" do
    it "sets @user" do
      get :new
      expect(assigns(:user)).to be_instance_of User
    end
  end
  
  describe "POST create" do
    context "with valid input" do
      before do
        post :create, user: { email: "mike@me.com", full_name: "Mike", password: "pasword" }
      end
      
      it "creates a new user" do
        expect(User.count).to eq(1)
      end
      it "sends authentication email" do
        
      end
    end
    context "with invalid input" do
      before do
        post :create, user: { email: "", full_name: "", password: "password" }
      end
      
      it "renders the new template" do
        expect(response).to render_template :new
      end
      it "sets @user" do
        expect(assigns(:user)).to be_instance_of User
      end
      it "doesn't create a new user" do
        expect(User.count).to eq(0)
      end
      it "sets the flash danger message" do
        expect(flash[:danger]).to be_present
      end
      it "validates uniquness of email regardless of case" do
        Fabricate(:user, email: "mike@me.com")
        post :create, user: { email: "mIkE@me.com", full_name: "Mike", password: "password" }
        expect(User.count).to eq(1)
      end
      it "doesn't allow invalid email address" do
        INVALID_EMAILS.each do |email|
          post :create, user: { email: email, full_name: "Mike", password: "password" }
        end
        expect(User.count).to eq(0)
      end
    end
  end
end
